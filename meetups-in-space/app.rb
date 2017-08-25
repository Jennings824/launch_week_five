require 'sinatra'
require_relative 'config/application'
require 'faker'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get "/meetups/:id" do
  @id = params[:id]
  @specific_meetup = Meetup.find(@id)
  @attendees = @specific_meetup.users

  erb :'meetups/show'
end

post '/meetups/:id' do
  attendees = Meetup.find(params[:id]).users
  if current_user
    attendees.each do |attendee|
      if attendee.id == current_user.id
        flash[:notice]= "You've already signed up for this meeting!"
        redirect "/meetups/#{params[:id]}"
        return
      end
    end
    Rsvp.create(meetup: Meetup.find(params[:id]), user: current_user)
    flash[:notice]= "You have joined the meeting"
    redirect "/meetups/#{params[:id]}"
  else
    flash[:notice]= "you need to be signed in"
    redirect "/meetups/#{params[:id]}"
  end
end

get '/new' do
  if session[:user_id]
    erb :'/new'
  else
    erb :'/error'
  end
end

post '/meetups' do
  @name = params["Name"]
  @description = params["Description"]
  @location = params["Location"]
  @username = current_user.username
  new_meetup= Meetup.create(name: @name, description: @description, location: @location, creator: @username)
  if new_meetup.valid?
    new_id = new_meetup.id
    flash[:notice]= "Meeting has been created"
    redirect "/meetups/#{new_id}"
  else
    flash[:notice]= new_meetup.errors.full_messages
    redirect "/new"
  end
end

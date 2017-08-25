require 'spec_helper'

feature "user visits index page" do

  before(:each) do
    Meetup.create(
      name: 'Pokemon Go Meetup',
      description: 'Catch em all!',
      location: 'Philadelphia',
      creator: 'Sebastisan'
    )
    Meetup.create(
      name: 'Moon',
      description: 'Lunacy?',
      location: 'The Moon',
      creator: 'Mike'
    )
  end

  scenario 'sees all the meetups' do
    visit '/meetups'

    expect(page).to have_content('Pokemon Go Meetup')
    expect(page).to have_link('Pokemon Go Meetup')
    expect(page).to_not have_content('Sebastian')
  end

  scenario 'sees meetups in alphabetical order' do
    visit "/meetups"

    first_meetup_position = page.body.index("Moon")
    last_meetup_position = page.body.index("Pokemon Go Meetup")
    expect(first_meetup_position).to be < last_meetup_position
  end
end

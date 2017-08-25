# require 'spec_helper'
#
# describe Meetup do
#   describe ".find_or_create_from_ominiauth" do
#     context "for an auth hash that does not have the provider and uid of an already existing meetup" do
#       let(:nonexisting_meetup) {
#         Meetup.new(
#           provider: "github",
#           uid: "1",
#           meetupname: "jarlax1",
#           email: "jarlax1@launchacademy.com",
#           avatar_url: "https://avatars2.githubmeetupcontent.com/u/174825?v=3&s=400"
#         )
#       }
#       let!(:auth_hash) {
#         mock_auth_for(nonexisting_meetup)
#       }
#       it "should create a new meetup and return the newly created meetup" do
#         meetup = Meetup.find_or_create_from_omniauth(auth_hash)
#         expect(meetup.uid).to eq(nonexisting_meetup.uid)
#         expect(meetup.provider).to eq(nonexisting_meetup.provider)
#         expect(Meetup.count).to eq(1)
#       end
#     end
#
#     context "for an auth hash that has the provider and uid of an already existing meetup" do
#       let(:existing_meetup) {
#         Meetup.create(
#
#           name: "jarlax1",
#           email: "jarlax1@launchacademy.com",
#           avatar_url: "https://avatars2.githubmeetupcontent.com/u/174825?v=3&s=400"
#         )
#       }
#       let!(:auth_hash) {
#         mock_auth_for(existing_meetup)
#       }
#       it "should return the existing meetup" do
#         meetup = Meetup.find_or_create_from_omniauth(auth_hash)
#         expect(meetup).to eq(existing_meetup)
#       end
#     end
#   end
# end

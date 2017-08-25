require 'spec_helper'

feature "user visits show page" do
  let! (:meetup) do
    Meetup.create(
      name: 'Pokemon Go Meetup',
      description: 'Catch em all!',
      location: 'Philadelphia',
      creator: 'Sebastian'
    )
  end
  scenario 'sees the individual page ' do
    visit '/meetups'
    click_link meetup.name

    expect(page).to have_content('Pokemon Go Meetup')
    expect(page).to have_content('Catch em all!')
    expect(page).to have_content('Philadelphia')
    expect(page).to have_content('Sebastian')
  end
end

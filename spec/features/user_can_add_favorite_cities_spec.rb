require 'rails_helper'

RSpec.feature "User Can Add Favorite Cities", type: :feature do
  before do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "/"
    click_link 'Sign Up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_confirmation', with: password
    click_button 'Sign Up'
  end

  scenario "user creates account and add favorite city" do
    expect(page).to have_content 'You have succesfully sign up.'
    click_link 'Add a city'
    fill_in 'city', with: "Miami"
    click_button 'Add Favorite City'
    expect(page).to have_content "Miami"
  end

  scenario "user creates account and add favorite city and deleted" do
    click_link 'Add a city'
    fill_in 'city', with: "Miami"
    click_button 'Add Favorite City'
    expect(page).to have_content "Miami"
    click_link "Delete"
    expect(page).to have_content "Favorite city deleted"
  end

  scenario "user can't create random cities" do
    click_link 'Add a city'
    fill_in 'city', with: "1284uarhg"
    click_button 'Add Favorite City'
    expect(page).to have_content "We couldn't find the city you are looking for"
  end

  scenario "user can click in city to get more current temperature"  do
    click_link 'Add a city'
    fill_in 'city', with: "Miami"
    click_button 'Add Favorite City'
    expect(page).to have_content "Miami"
    click_link "Miami"
    expect(page).to have_content "Current temperature"
  end
  scenario "user can click in city to get more min temperature"  do
    click_link 'Add a city'
    fill_in 'city', with: "Miami"
    click_button 'Add Favorite City'
    expect(page).to have_content "Miami"
    click_link "Miami"
    expect(page).to have_content "Min temperature"
  end
  scenario "user can click in city to get more max temperature"  do
    click_link 'Add a city'
    fill_in 'city', with: "Miami"
    click_button 'Add Favorite City'
    expect(page).to have_content "Miami"
    click_link "Miami"
    expect(page).to have_content "Max temperature"
  end
end

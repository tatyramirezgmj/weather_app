require 'rails_helper'

RSpec.feature "User Can Create Account", type: :feature do
  scenario "user creates account" do
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
    expect(page).to have_content 'You have succesfully sign up.'
  end

  scenario "user can log in" do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "users/new"
    click_link 'Sign Up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_confirmation', with: password
    click_button 'Sign Up'
    visit "/login"
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
    expect(page).to have_content 'You have succesfully logged in.'
  end

  scenario 'user log out' do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "users/new"
    click_link 'Sign Up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_confirmation', with: password
    click_button 'Sign Up'
    visit "/login"
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
    click_link 'Logout'
    expect(page).to have_content 'You have succesfully logout'
  end

  scenario 'user puts wrong input (password) in sign up form' do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "users/new"
    click_link 'Sign Up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_confirmation', with: "hello"
    click_button 'Sign Up'
    expect(page).to have_content "Please check that your passwords match."
  end

  scenario 'user is not a register and tries to login' do
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "/login"
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
    expect(page).to have_content 'Something was wrong please try again.'
  end

  scenario "user can't login with wrong password" do
    name = Faker::Name.name
    email = Faker::Internet.email
    password = Faker::Book.title
    visit "users/new"
    click_link 'Sign Up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_confirmation', with: password
    click_button 'Sign Up'
    visit "/login"
    fill_in 'Email', with: email
    fill_in 'Password', with: "hello"
    click_button 'Log In'
    expect(page).to have_content 'Something was wrong please try again.'
  end
end

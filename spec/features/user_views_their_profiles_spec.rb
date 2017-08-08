require 'rails_helper'

RSpec.feature "UserViewsTheirProfiles", type: :feature do

  let!(:user) do
    User.create(
    name: "John Smith",
    email: "js@example.com",
    password: "hello",
    password_digest:"hello"
    )
  end

  before do
      visit users_path(@user)
    end

    it "displays their name" do
      expect(page).to have_content user.name
    end

end

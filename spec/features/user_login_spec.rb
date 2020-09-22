require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do

    @user = User.create!(
      first_name: "Tesla",
      last_name: "Name1",
      email: "test@tesla.com",
      password: "12345", 
      password_confirmation: "12345"
    )
    
  end

  scenario "User logs in" do
    # ACT
    
    visit '/login'
    fill_in 'email', with: "test@tesla.com"
    fill_in 'password', with: '12345'
    save_screenshot
    click_on 'Submit'
    
    save_screenshot
    
    expect(page).to have_text 'Log out'
  end

end
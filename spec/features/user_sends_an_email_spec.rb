require 'rails_helper'
require 'pry'
feature 'User sends their information', %Q{
  As an visitor,
  I want to contact the people at Andrews Design,
  So that I can hire them for projects.
} do
  before do
    Admin.create(id: 1, first_name: 'Isaac', last_name: 'Tullis', bio: 'HEY!')
    Admin.create(id: 2, first_name: 'Isaac', last_name: 'Tullis', bio: 'HEY!')
    Admin.create(id: 3, first_name: 'Mary', last_name: 'Tullis', bio: 'HEY!')
  end
  scenario 'user visits home page' do
    visit root_path
    find('.contact-button').click

    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Smith'
    fill_in 'user_email', with: 'wild@wild.com'
    click_button 'Submit'

    expect(page).to have_content("Congrats! They will respond shortly")
  end
  scenario "Create a contact and deliver mail" do
    visit root_path
    find('.contact-button').click

    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Smith'
    fill_in 'user_email', with: 'wild@wild.com'
    click_button 'Submit'

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario 'Contact not created correctly no mail delievered' do
    visit root_path
    find('.contact-button').click

    fill_in 'user_first_name', with: ''
    fill_in 'user_last_name', with: 'Smith'
    fill_in 'user_email', with: 'wild@wild.com'
    click_button 'Submit'

    expect(ActionMailer::Base.deliveries.count).to eq(0)
    expect(page).to have_content('There must have been an error!')
  end
end

require 'rails_helper'

feature 'User visits the home page', %Q{
  As an visitor,
  I want to find information about Andrew Design,
  So that I can hire them for projects.
} do

  scenario 'user visits home page' do
    visit root_path

    expect(page).to have_content("Andrews Design")
  end
end

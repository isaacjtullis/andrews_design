require 'rails_helper'

feature 'User visits the home page', %Q{
  As an visitor,
  I want to find information about Andrew Design,
  So that I can hire them for projects.
} do
  before do
    Admin.create(id: 1, first_name: 'Isaac', last_name: 'Tullis', bio: 'HEY!')
    Admin.create(id: 2, first_name: 'Isaac', last_name: 'Tullis', bio: 'HEY!')
    Admin.create(id: 3, first_name: 'Mary', last_name: 'Tullis', bio: 'HEY!')
  end

  scenario 'user visits home page' do
    visit root_path

    expect(page).to have_content("Andrews Design")
  end
end

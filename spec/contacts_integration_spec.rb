require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expections, false)

describe('the contact list file path', {:type => :feature}) do
  it('processes the users click and return the contact list page') do
    visit('/')
    click_link('See Contact List')
    expect(page).to have_content('Contact List')
  end
end

describe('the add contact list file path', {:type => :feature}) do
  it('processes the users click and return the add contact form page') do
    visit('/')
    click_link('Add Contact')
    expect(page).to have_content('Add Contact:')
  end
end

describe('add new contact to list and success file path', {:type => :feature}) do
  it('processes users input and click to return success page') do
    visit('/contacts/new')
    fill_in('first_name', :with => 'Bruce')
    fill_in('last_name', :with => 'Wayne')
    click_button('Save')
    expect(page).to have_content('Information Saved')
  end
end

describe('contact details path', {:type => :feature}) do
  it('opens new page for each listed contact') do
    visit('contacts')
    click_link('Bruce Wayne')
    expect(page).to have_content('Contact Details')
  end
end

describe('add address to contact list and success file path', {:type => :feature}) do
  it('processes users input and click to return success page') do
    visit('/contacts/1')
    fill_in('address', :with => '101 loop')
    click_button('Save Address')
    expect(page).to have_content('Information Saved')
  end
end

describe('add phone to contact list and success file path', {:type => :feature}) do
  it('processes users input and click to return success page') do
    visit('/contacts/1')
    fill_in('number', :with => '123456789')
    click_button('Save Phone Number')
    expect(page).to have_content('Information Saved')
  end
end

require 'rails_helper'

RSpec.feature "Inventories", type: :feature do
  before(:each) do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123', password_confirmation: '123123')
    @inventory = Inventory.create(name: 'test', description: 'test desc', user_id: @user.id, )

    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'
    visit inventories_path
  end

  it 'page should have inventory name' do 
    expect(page).to have_content(@inventory.name)
  end

  it 'page should have inventory description' do 
    expect(page).to have_content(@inventory.description)
  end

  it 'page should have a remove inventory button' do 
    expect {
      click_button 'Remove'
    }.to change(Inventory, :count).by(-1)
  end

  it 'page should have a link to add inventory' do 
    expect(page).to have_link('add inventory')
  end
end

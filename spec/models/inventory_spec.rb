require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before :all do 
    User.delete_all
    @user = User.create(name: "hamid", email: "hamid123@gmail.com", password: 'test123', id: 1)
  end

  it 'should check inventory name is present' do
   inventory1 = Inventory.create(name: 'inv1', description: 'test', user_id: @user.id)
   inventory2 = Inventory.create(description: 'test', user_id: @user.id)

   expect(inventory1).to be_valid
   expect(inventory2).not_to be_valid
  end

  it 'should check inventory description is present' do
   inventory1 = Inventory.create(name: 'inv1', description: 'test', user_id: @user.id)
   inventory2 = Inventory.create(name: 'inv2', user_id: @user.id)

   expect(inventory1).to be_valid
   expect(inventory2).not_to be_valid
  end

  it 'should belong to the correct user' do
    inventory = Inventory.create(name: 'inv1', description: 'test', user_id: @user.id)

    expect(inventory.user.name).to eq(@user.name)
  end
end

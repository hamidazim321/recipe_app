require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    User.delete_all
    @user = User.create!(name: 'hamid', email: 'hamid123@gmail.com', password: 'test123', id: 1)
  end

  it 'should check presence of name' do
    recipe1 = Recipe.create(name: 'recipe1', description: 'testing', preparation_time: 2, cooking_time: 3,
                            user_id: @user.id)
    recipe2 = Recipe.create(description: 'testing', preparation_time: 2, cooking_time: 3, user_id: @user.id)

    expect(recipe1).to be_valid
    expect(recipe2).not_to be_valid
  end

  it 'should check cooking_time and preparation_time to be positive numbers' do
    recipe1 = Recipe.create(name: 'recipe1', description: 'testing', preparation_time: 2, cooking_time: 3,
                            user_id: @user.id)
    recipe2 = Recipe.create(name: 'recipe2', description: 'testing', preparation_time: -2, cooking_time: -3,
                            user_id: @user.id)

    expect(recipe1).to be_valid
    expect(recipe2).not_to be_valid
  end

  it 'should check description is present' do
    recipe1 = Recipe.create(name: 'recipe1', description: 'testing', preparation_time: 2, cooking_time: 3,
                            user_id: @user.id)
    recipe2 = Recipe.create(name: 'recipe2', preparation_time: 2, cooking_time: 3, user_id: @user.id)

    expect(recipe1).to be_valid
    expect(recipe2).not_to be_valid
  end
end

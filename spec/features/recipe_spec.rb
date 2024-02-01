require 'rails_helper'

RSpec.feature "Recipes", type: :feature do
  before(:each) do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123',
                        password_confirmation: '123123')
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 2, cooking_time: 3, description: 'best pizza', user_id: @user.id)
    @food = Food.create(name: 'Apple', measurement_unit: 'Kg', price: 10)
    @recipe_food = RecipeFood.create(quantity: 20, food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Log in'
    visit recipes_path
  end

  it "should display user recipes" do 
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.description)
  end

  it 'clicking recipe title should lead to recipe#show' do 
    click_link @recipe.name 
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content('add food')
    expect(page).to have_content('Public')
  end
  it 'should have a remove button' do 
    expect(page).to have_button('Remove')
  end

  it 'clicking remove button should delete the recipe' do 
    expect {
      click_button 'Remove'
    }.to change(Recipe, :count).by(-1)
  end

  describe 'recipe#show' do 
    it 'clicking the Public button should change the public status of recipe' do
      click_link @recipe.name
      initial_public_status = @recipe.public
      if @recipe.public
        click_button 'on'
      else
        click_button 'off'
      end
      @recipe.reload
      expect(@recipe.public).not_to eq(initial_public_status)
    end
  end

end

require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'should check presence of name' do
    food1 = Food.new(measurement_unit: 'kg', price: 23)
    food2 = Food.new(name: 'food2', measurement_unit: 'g', price: 23)
    expect(food1).not_to be_valid
    expect(food2).to be_valid
  end
  it 'should check measurement_unit is one of [mg, g, kg] otherwise its not valid' do
    food1 = Food.new(name: 'food1', measurement_unit: 'mg', price: 23)
    food2 = Food.new(name: 'food2', measurement_unit: 'none of above', price: 23)
    expect(food2).not_to be_valid
    expect(food1).to be_valid
  end
  it 'should check that price is a positive number' do
    food1 = Food.new(name: 'food1', measurement_unit: 'mg', price: -23)
    food2 = Food.new(name: 'food2', measurement_unit: 'mg', price: 23)
    expect(food1).not_to be_valid
    expect(food2).to be_valid
  end
  it 'should check that name length is below 120 chars' do
    invalid_name = "a"*121
    food1 = Food.new(name: 'food1', measurement_unit: 'mg', price: 23)
    food2 = Food.new(name: invalid_name, measurement_unit: 'mg', price: 23)
    expect(food1).to be_valid
    expect(food2).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe RecipesFoods, type: :model do
  kay = User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success', confirmation_sent_at: '2023-08-02 10:07:13.244302', confirmed_at: '2023-08-02 10:07:28.244302')

  recipe = Recipe.new(name: 'spice',
    preparation: '1 hour',
    cooking: '30mins',
    desc: 'Description is here',
    public: true,
    user: kay)

  food = Food.new(name: 'Chicken',
    quantity: 2,
    measurement_unit: 'kg',
    price: 45,
    user: kay)

  subject do
    RecipesFoods.new(recipe_id: recipe.id, food_id: food.id, quantity: 5)
  end

  before { subject.save }

  it 'should have a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
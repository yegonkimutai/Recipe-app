require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(
      name: 'Yegon',
      email: 'bb@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now, confirmation_sent_at: Time.now
    )
    @food = Food.create(
      name: 'Beef',
      measurement_unit: 'KG',
      price: 20.00,
      quantity: 4,
      user_id: @user.id
    )
    sign_in @user
  end

  describe '#index' do
    before(:each) do
      visit foods_path
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end

    it 'should display food details' do
      expect(page).to have_content(@food.measurement_unit)
      expect(page).to have_content(@food.quantity)
    end

    it 'on clicking on a food, should redirect to that food show page' do
      click_on @food.name
      expect(page).to have_current_path(food_path(@food))
    end
  end

  describe '#show' do
    before(:each) do
      visit food_path(@food)
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end
  end

  describe '#destroy' do
    it 'should delete the food' do
      visit foods_path

      expect(page).to have_content(@food.name)

      click_on 'delete'

      expect(page).to have_current_path(foods_path)
    end
  end
end
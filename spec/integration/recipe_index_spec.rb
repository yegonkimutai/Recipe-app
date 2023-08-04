require 'rails_helper'

require 'rails_helper'
RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(
      name: 'Brian',
      email: 'aa@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now, confirmation_sent_at: Time.now
    )
    @recipe = Recipe.create(
      name: 'Chicken soup',
      preparation: 10,
      cooking: 20,
      desc: 'cook it well',
      public: false,
      user_id: @user.id
    )
    sign_in @user
  end
  describe '#index' do
    before(:each) do
      visit recipes_path
    end
    it 'should display recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'should display recipe description' do
      expect(page).to have_content(@recipe.desc)
    end

    it 'on clicking on a recipe, should redirect to that recipe show page' do
      click_on @recipe.name
      assert_current_path recipe_path(@recipe)
    end
  end

  describe '#show' do
    before(:each) do
      visit recipe_path(@recipe)
    end
    scenario 'should display recipe name' do
      assert_text @recipe.name
    end
    scenario 'should display recipe description' do
      assert_text @recipe.desc
    end
  end
end

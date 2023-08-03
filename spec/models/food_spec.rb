require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(name: 'Chicken',
             quantity: 2,
             measurement_unit: 'kg',
             price: 45,
             user_id: 1)
  end

  before { subject.save }

  # it 'should be valid' do
  #   expect(subject).to be_valid
  # end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number as quantity' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end

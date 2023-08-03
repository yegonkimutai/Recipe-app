require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    kay = User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success', confirmation_sent_at: '2023-08-02 10:07:13.244302', confirmed_at: '2023-08-02 10:07:28.244302')
    Food.new(name: 'Chicken',
             quantity: 2,
             measurement_unit: 'kg',
             price: 45,
             user: kay)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

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

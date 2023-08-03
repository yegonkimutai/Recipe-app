require 'rails_helper'

RSpec.describe Food, type: :model do
  @kay = User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success', confirmation_sent_at: '2023-08-02 10:07:13.244302', confirmed_at: '2023-08-02 10:07:28.244302')

  subject do
    Recipe.new(name: 'spice',
             preparation: '1 hour',
             cooking: '30mins',
             desc: 'Description is here',
             public: true,
             user: @kay)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a description' do
    subject.desc = nil
    expect(subject).to_not be_valid
  end

  it 'should have a cooking time' do
    subject.cooking = nil
    expect(subject).to_not be_valid
  end

  it 'should have a preparation time' do
    subject.preparation = nil
    expect(subject).to_not be_valid
  end

  it 'should have a public field of type Boolean' do
    field = subject.public.instance_of?(TrueClass)
    expect(field).to eq true
  end
end

require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success',
             confirmation_sent_at: '2023-08-02 10:07:13.244302', confirmed_at: '2023-08-02 10:07:28.244302')
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end

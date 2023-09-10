require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', email: 'test@test.com', password: 'asdasd') }

  before { subject.save }

  context 'Validation Tests' do
    it 'User should pass validation' do
      expect(subject).to be_valid
    end

    it 'User should have a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'User should have an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'User should have a password' do
      subject.password = 'qweqwe'
      expect(subject).to be_valid
    end
  end

  context 'Association Tests' do
    it 'User should have many categories' do
      association = User.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
    end

    it 'User should have many entities' do
      association = User.reflect_on_association(:entities)
      expect(association.macro).to eq(:has_many)
    end
  end
end

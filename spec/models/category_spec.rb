require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'John Doe', email: 'test@test.com', password: 'asdasd')
  end

  before(:each) do
    @category = Category.new(user: subject, name: 'Test Category', icon: 'icon image')
  end

  context 'Validation Tests' do
    it 'Category should pass validation' do
      expect(@category).to be_valid
    end

    it 'Category should have a name' do
      expect(@category.name).to be_present
    end

    it 'Category should have an icon' do
      expect(@category.icon).to be_present
    end

    it 'Category should have a user id' do
      expect(@category.user_id).to be_present
    end
  end

  context 'Association Tests' do
    it 'Category should belong to a user' do
      association = Category.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'Category should have many entities' do
      association = Category.reflect_on_association(:entities)
      expect(association.macro).to eq(:has_many)
    end
  end
end
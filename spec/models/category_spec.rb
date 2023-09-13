require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'John Doe', email: 'test1@test.com', password: 'asdasd')
  end

  before(:each) do
    @category = Category.new(user: subject, name: 'Test Category')
  end

  context 'Validation Tests' do
    it 'Category should pass validation' do
      expect(@category).to be_valid
    end

    it 'Category should have a name' do
      expect(@category.name).to be_present
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
  end
end

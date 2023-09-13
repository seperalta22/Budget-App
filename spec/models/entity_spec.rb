require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'test1@test.com', password: 'asdasd')
    @category = Category.create(user: @user, name: 'Test Category')
    @entity = Entity.new(user: @user, name: 'Test Entity', amount: 50)
  end

  context 'Validation Tests' do
    it 'Entity should pass validation' do
      expect(@entity).to be_valid
    end

    it 'Entity should have a name' do
      expect(@entity.name).to be_present
    end

    it 'Entity should have an amount' do
      expect(@entity.amount).to be_present
    end

    it 'Entity should have a user id' do
      expect(@entity.user_id).to be_present
    end
  end

  context 'Association Tests' do
    it 'Entity should belong to a user' do
      association = Entity.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

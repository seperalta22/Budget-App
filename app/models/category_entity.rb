class CategoryEntity < ApplicationRecord
  belongs_to :category
  belongs_to :entity
  validates :entity,
            uniqueness: { scope: :category,
                          message: lambda { |object, _data|
                                     "#{object.entity.name} already exists in this category"
                                   } }
end

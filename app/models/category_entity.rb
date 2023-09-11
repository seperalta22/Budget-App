class CategoryEntity < ApplicationRecord
  validates :entity_id, presence: true
  validates :category_id, presence: true
  belongs_to :category
  belongs_to :entity
  validates :entity,
            uniqueness: { scope: :category,
                          message: lambda { |object, _data|
                                     "#{object.entity.name} already exists in this category"
                                   } }
end

class Recipe < ApplicationRecord
  belongs_to :user
  has_many_attached :recipe_image
  with_options presence: true do
    validates :title
    validates :material
    validates :make
  end
end
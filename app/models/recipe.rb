class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :recipe_image

  with_options presence: true do
    validates :title
    validates :material
    validates :make
  end
end
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :recipe_image
  has_many :favorites

  def self.search(search)
    if search != ""
      Recipe.where('title LIKE(?)', "%#{search}%")
    else
      Recipe.all
    end
  end
  with_options presence: true do
    validates :title
    validates :material
    validates :make
  end
end
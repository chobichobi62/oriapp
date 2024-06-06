class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :recipe_image
  has_many :favorites
  has_many :favotitg_users, through: :favorites, source: :user
  has_many :liked_by_users, through: :favorites, source: :user

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

  def liked_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
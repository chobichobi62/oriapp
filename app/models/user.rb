class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :recipes
         has_many :comments
         has_one_attached :profile_image
         has_many :favorites
         has_many :favorite_recipes, through: :favorites, source: :recipe
         has_many :liked_recipes, through: :favorites, source: :recipe
end

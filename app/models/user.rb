class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :recipes
         has_many :comments
         has_one_attached :profile_image
         has_many :favorites, dependent: :destroy
         has_many :favorite_recipes, through: :favorites, source: :recipe
end

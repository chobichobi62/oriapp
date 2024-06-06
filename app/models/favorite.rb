class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, counter_cache: :favorites_count

  validates :user_id, uniqueness: { scope: :recipe_id }
end

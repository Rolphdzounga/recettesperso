class Ingredient < ApplicationRecord
  validates :ingredientnom, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :ingredientnom
  has_many :preparations
  has_many :recettes, through: :preparations

end

class Ingredient < ApplicationRecord
  validates :nom_ing, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :nom_ing
  has_many :recette_ingredients
  has_many :recettes, through: :recette_ingredients
end

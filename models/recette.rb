class Recette < ApplicationRecord
  belongs_to :chef
	validates :nomR7, presence: {message:"le nom de la recette est obligatoir"}
	validates :description, presence: {message:"la description de la recette est obligatoire"}, length: { minimum: 5, maximum: 500,message:"le nombre de caractère pour la description doit etre compris entre 5 et 500" }
	has_many :recette_ingredients
    has_many :ingredients, through: :recette_ingredients
    has_many :commentaires, dependent: :destroy
end

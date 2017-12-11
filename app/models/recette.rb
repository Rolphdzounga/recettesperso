class Recette < ApplicationRecord
  belongs_to :chef

	validates :recettenom, presence: {message:"le nom de la recette est obligatoir"}
	validates :recettedesc, presence: {message:"la description de la recette est obligatoire"}, length: { minimum: 5, maximum: 500,message:"le nombre de caractère pour la description doit etre compris entre 5 et 500" }

    has_many :commentaires, dependent: :destroy
    has_many :preparations
  	has_many :ingredients, through: :preparations 
end

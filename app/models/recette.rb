class Recette < ApplicationRecord
  belongs_to :chef
	validates :nomR7, presence: true
	validates :description, presence: true, length: { minimum: 5, maximum: 500 }
end

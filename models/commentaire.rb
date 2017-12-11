class Commentaire < ApplicationRecord
  belongs_to :chef
  belongs_to :recette
  validates :chef_id, presence: true
  validates :recette_id, presence: true
  default_scope -> { order(updated_at: :desc)}
end

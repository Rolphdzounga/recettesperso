class RecettesIngredient < ApplicationRecord
  belongs_to :groupable, polymorphic: true
end

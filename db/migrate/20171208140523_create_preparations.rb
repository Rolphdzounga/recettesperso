class CreatePreparations < ActiveRecord::Migration[5.1]
  def change
    create_table :preparations do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recette, index: true

      t.timestamps
    end
  end
end

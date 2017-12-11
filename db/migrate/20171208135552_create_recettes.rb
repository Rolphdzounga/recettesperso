class CreateRecettes < ActiveRecord::Migration[5.1]
  def change
    create_table :recettes do |t|
      t.string :recettenom
      t.text :recettedesc
      t.references :chef, foreign_key: true

      t.timestamps
    end
  end
end

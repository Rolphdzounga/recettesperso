class CreateCommentaires < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaires do |t|
      t.text :commentairetexte

	  t.integer :chef_id
	  t.integer :recette_id

      t.timestamps
    end
  end
end

class RenameNomToNomR7InRecettes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :recettes, :nom, :nomR7
  end
end

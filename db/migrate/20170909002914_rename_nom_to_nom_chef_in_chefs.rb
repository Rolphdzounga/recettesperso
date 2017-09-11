class RenameNomToNomChefInChefs < ActiveRecord::Migration[5.1]
  def change
  	rename_column :chefs, :nom, :nomChef
  end
end

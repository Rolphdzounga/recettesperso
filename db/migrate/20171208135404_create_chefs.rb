class CreateChefs < ActiveRecord::Migration[5.1]
  def change
    create_table :chefs do |t|
      t.string :chefnom
      t.string :chefemail

      t.timestamps
    end
  end
end

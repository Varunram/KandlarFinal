class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :price
      t.string :closesin
      t.string :description
      t.string :uid

      t.timestamps
    end
  end
end

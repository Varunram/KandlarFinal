class DropGasketsTable < ActiveRecord::Migration
  def change
    drop_table :gaskets
  end
end

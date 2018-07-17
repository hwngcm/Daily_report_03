class AddDivAnd < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :position_id, :integer
    add_column :users, :division_id, :integer
  end
end

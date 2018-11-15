class AddColumnstoCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :user_id
    add_index :cats, :user_id, null: false
  end
end

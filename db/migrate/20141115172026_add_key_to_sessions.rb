class AddKeyToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :key, :string, null: false
    add_index :sessions, :key
  end
end

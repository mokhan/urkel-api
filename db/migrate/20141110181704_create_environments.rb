class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.references :service, index: true
      t.string :api_key
    end
  end
end

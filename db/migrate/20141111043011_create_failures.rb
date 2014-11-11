class CreateFailures < ActiveRecord::Migration
  def change
    create_table :failures do |t|
      t.references :environment, index: true
      t.string :message
      t.string :hostname
      t.string :error_type
      t.text :backtrace, array: true, default: []

      t.timestamps
    end
  end
end

class AddRevokedAtToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :revoked_at, :datetime, default: nil
  end
end

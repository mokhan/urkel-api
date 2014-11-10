class RenameApplicationsToServices < ActiveRecord::Migration
  def change
    rename_table :applications, :services
  end
end

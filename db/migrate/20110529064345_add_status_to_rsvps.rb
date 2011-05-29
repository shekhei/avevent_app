class AddStatusToRsvps < ActiveRecord::Migration
  def self.up
    add_column :rsvps, :status, :string
  end

  def self.down
    remove_column :rsvps, :status
  end
end

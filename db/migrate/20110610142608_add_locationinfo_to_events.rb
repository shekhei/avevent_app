class AddLocationinfoToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :location, :string
    add_column :events, :info, :text
  end

  def self.down
    remove_column :events, :info
    remove_column :events, :location
  end
end

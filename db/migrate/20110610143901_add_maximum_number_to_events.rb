class AddMaximumNumberToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :max_number, :integer
  end

  def self.down
    remove_column :events, :max_number
  end
end

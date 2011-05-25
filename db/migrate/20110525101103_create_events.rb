class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :peak
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

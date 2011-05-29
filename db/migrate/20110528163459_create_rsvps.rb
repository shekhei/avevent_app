class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :event_id
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end

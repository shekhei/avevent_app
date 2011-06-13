class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
	add_index :microposts, :event_id
  end

  def self.down
    drop_table :microposts
  end
end

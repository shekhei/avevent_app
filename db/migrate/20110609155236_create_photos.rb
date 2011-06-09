class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.timestamps
    end
  end

  def self.downrequire File.dirname(__FILE__) + '/../../../railscasts-episodes/episode-253/picturesque/db/migrate/20110213032940_create_paintings'
  
    drop_table :photos
  end
end

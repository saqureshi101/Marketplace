class AddAttachmentResourceToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :games, :resource
  end
end

class AddAttachmentMaddenToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :madden
    end
  end

  def self.down
    remove_attachment :games, :madden
  end
end

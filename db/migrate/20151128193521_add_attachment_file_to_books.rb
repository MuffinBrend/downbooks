class AddAttachmentFileToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :books, :file
  end
end

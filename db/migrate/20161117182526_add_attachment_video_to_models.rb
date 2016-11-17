class AddAttachmentVideoToModels < ActiveRecord::Migration
  def up
      add_attachment :clips, :video
    end

  def down
    remove_attachment :clips, :video
  end
end

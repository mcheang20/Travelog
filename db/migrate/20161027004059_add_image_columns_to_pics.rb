class AddImageColumnsToPics < ActiveRecord::Migration
  def up
  add_attachment :pics, :image
  end

  def down
    remove_attachment :pics, :image
  end
end

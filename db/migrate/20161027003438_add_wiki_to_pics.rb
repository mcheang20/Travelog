class AddWikiToPics < ActiveRecord::Migration
  def change
    add_reference :pics, :wiki, index: true, foreign_key: true
  end
end

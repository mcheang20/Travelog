class AddWikiToClips < ActiveRecord::Migration
  def change
    add_reference :clips, :wiki, index: true, foreign_key: true
  end
end

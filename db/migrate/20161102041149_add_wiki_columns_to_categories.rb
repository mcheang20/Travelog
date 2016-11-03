class AddWikiColumnsToCategories < ActiveRecord::Migration
  def change
      add_column :wikis, :category_id, :integer
  end
end

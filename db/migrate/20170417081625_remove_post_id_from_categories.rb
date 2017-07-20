class RemovePostIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :categories, column: :post_id
    remove_column :categories, :post_id
  end
end

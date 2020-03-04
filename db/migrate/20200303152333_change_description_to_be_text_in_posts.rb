class ChangeDescriptionToBeTextInPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :description, :text
  end
end

class AddPublishedToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :publised, :boolean, default: false
  end
end

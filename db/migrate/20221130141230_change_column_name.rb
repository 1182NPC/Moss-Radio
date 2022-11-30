class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :publised, :published
  end
end

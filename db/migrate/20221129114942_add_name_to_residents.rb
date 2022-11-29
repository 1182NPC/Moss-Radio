class AddNameToResidents < ActiveRecord::Migration[7.0]
  def change
    add_column :residents, :name, :string
  end
end

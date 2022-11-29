class AddPhotoToResident < ActiveRecord::Migration[7.0]
  def change
    add_column :residents, :photo, :string
  end
end

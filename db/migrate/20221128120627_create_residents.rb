class CreateResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :residents do |t|
      t.text :bio
      t.string :links

      t.timestamps
    end
  end
end

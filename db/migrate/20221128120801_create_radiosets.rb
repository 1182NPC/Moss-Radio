class CreateRadiosets < ActiveRecord::Migration[7.0]
  def change
    create_table :radiosets do |t|
      t.datetime :date
      t.string :audio_link
      t.references :resident, null: false, foreign_key: true

      t.timestamps
    end
  end
end

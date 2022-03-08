class CreateCaptions < ActiveRecord::Migration[7.0]
  def change
    create_table :captions do |t|
      t.string :text
      t.string :timestamp
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end

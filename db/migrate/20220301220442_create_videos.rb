class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :web_id
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :image
      t.string :title
      t.text :description
      t.references :track, index: true

      t.timestamps null: false
    end
    add_foreign_key :contests, :tracks
  end
end

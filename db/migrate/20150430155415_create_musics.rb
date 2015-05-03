class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :audio
      t.references :contest, index: true
      t.references :user, index: true

      t.timestamps null: false
      t.has_attached_file :audio
    end
    add_foreign_key :musics, :contests
    add_foreign_key :musics, :users
  end
end

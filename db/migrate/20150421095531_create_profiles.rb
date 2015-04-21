class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :name
      t.string :surname
      t.string :band
      t.string :role
      t.text :about
      t.string :photo

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end

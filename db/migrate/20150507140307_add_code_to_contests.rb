class AddCodeToContests < ActiveRecord::Migration
  def change
    add_column :contests, :code, :string
  end
end

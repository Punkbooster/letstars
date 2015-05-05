class AddContestDatesToContests < ActiveRecord::Migration
  def change
    add_column :contests, :contest_end, :datetime
    add_column :contests, :voting_end, :datetime
  end
end

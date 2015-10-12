class AddTeamIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :team_id, :integer
  end
end

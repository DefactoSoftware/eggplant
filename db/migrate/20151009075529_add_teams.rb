class AddTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
    end
  end
end

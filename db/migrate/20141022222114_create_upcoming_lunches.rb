class CreateUpcomingLunches < ActiveRecord::Migration
  def change
    create_table :upcoming_lunches do |t|
      t.string :location
      t.date :date
      t.belongs_to :lunchpartner1
      t.belongs_to :lunchpartner2
      t.boolean :lunchpartner1_accept
      t.boolean :lunchpartner2_accept

      t.timestamps
    end
  end
end

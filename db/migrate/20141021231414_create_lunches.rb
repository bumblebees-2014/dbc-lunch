class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :location
      t.date :date
      t.belongs_to :lunchpartner1
      t.belongs_to :lunchpartner2
      t.timestamps
    end
  end
end

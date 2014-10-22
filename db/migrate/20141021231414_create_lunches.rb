class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :location
      t.date :date
      t.belongs_to :lunchpartner1
      t.belongs_to :lunchpartner2
      t.boolean :lunchpartner1_accept, default: false
      t.boolean :lunchpartner2_accept, default: false

      t.timestamps
    end
  end
end

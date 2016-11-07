class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true
      t.boolean :available
      t.date :date
      t.time :startTime
      t.time :endTime

      t.timestamps
    end
  end
end


(dayShift.first.available)
class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.boolean :editSchedule
      t.boolean :acceptDenyShift
      t.boolean :scheduleable
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end

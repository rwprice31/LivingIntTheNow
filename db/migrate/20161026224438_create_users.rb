class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   :firstName
      t.string   :lastName
      t.boolean  :active
      t.boolean  :admin
      t.string   :phone

      t.timestamps
    end
  end
end

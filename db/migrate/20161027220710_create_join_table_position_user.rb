class CreateJoinTablePositionUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :positions, :users do |t|
      t.integer :position_id
      t.integer :user_id
    end
  end
end

index :positions_users, :user_id
index :positions_users, :position_id
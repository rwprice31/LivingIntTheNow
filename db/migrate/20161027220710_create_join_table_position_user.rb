class CreateJoinTablePositionUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :positions, :users do |t|
<<<<<<< HEAD
      # t.index [:position_id, :user_id]
      # t.index [:user_id, :position_id]
=======
       #t.index [:position_id, :user_id]
       #t.index [:user_id, :position_id]
>>>>>>> dd775e9a8367be3e460a09c2430567b85f04a150
    end
    add_index :positions_users, :user_id
    add_index :positions_users, :position_id
  end
end

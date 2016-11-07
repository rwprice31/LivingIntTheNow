class CreateJoinTablePositionUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :positions, :users do |t|

       #t.index [:position_id, :user_id]
       #t.index [:user_id, :position_id]

    end
    add_index :positions_users, :user_id
    add_index :positions_users, :position_id
  end
end

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :opponent
      t.string :player, default: 'x'
      t.string :current_player
      t.string :board
      t.timestamps null: false
    end
  end
end

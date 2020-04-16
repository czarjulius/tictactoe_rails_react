class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :opponent, default:'human'
      t.string :player, default: 'x'
      t.string :current_player, default:'player1'
      t.string :board
      t.timestamps null: false
    end
  end
end

# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :opponent
      t.string :player, default: 'x'
      t.string :current_player
      t.text :board, array: true, default: '{}'
      t.timestamps null: false
    end
  end
end

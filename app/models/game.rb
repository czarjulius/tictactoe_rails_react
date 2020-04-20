class Game < ApplicationRecord
    validates :opponent, presence: true
    validates :current_player, presence: true

end

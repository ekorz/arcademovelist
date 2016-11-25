class Character < ActiveRecord::Base
  belongs_to :game
  has_many :moves
end

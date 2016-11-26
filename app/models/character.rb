class Character < ActiveRecord::Base
  belongs_to :game
  has_many :moves, dependent: :destroy
end

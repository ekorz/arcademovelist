class Game < ActiveRecord::Base
	has_many :characters
	has_many :moves
end

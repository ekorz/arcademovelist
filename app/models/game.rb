class Game < ActiveRecord::Base
	has_many :tabs, as: :tabable, dependent: :destroy
end

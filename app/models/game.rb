class Game < ActiveRecord::Base
  has_many :tabs, as: :tabable, :order => 'position ASC', dependent: :destroy
end

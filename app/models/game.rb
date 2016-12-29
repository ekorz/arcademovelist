class Game < ActiveRecord::Base
  has_many :tabs, as: :tabable, :order => 'position DESC', dependent: :destroy
end

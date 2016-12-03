class Character < ActiveRecord::Base
  belongs_to :tab
  has_many :tabs, as: :tabable
end

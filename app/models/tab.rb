class Tab < ActiveRecord::Base
  belongs_to :tabable, polymorphic: true
  
  has_many :moves, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :setups, dependent: :destroy
  has_many :fatalities, dependent: :destroy
  #has_many :etc, dependent: :destroy
end

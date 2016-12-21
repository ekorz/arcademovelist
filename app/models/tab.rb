class Tab < ActiveRecord::Base
  
  belongs_to :tabable, polymorphic: true

  has_many :tabs, as: :tabable
  
  has_many :moves, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :setups, dependent: :destroy
  has_many :fatalities, dependent: :destroy
  has_many :builds, dependent: :destroy

  accepts_nested_attributes_for :moves, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :fatalities, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :builds, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :setups, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:description].blank? }, allow_destroy: true
  
  #has_many :etc, dependent: :destroy

  def singular
    self.tab_type.singularize.downcase rescue nil
  end

  def singular_titlecase
    self.tab_type.singularize.titlecase rescue nil
  end

  def plural
    self.tab_type.pluralize.downcase rescue nil
  end

  def self.relations
    Tab.reflect_on_all_associations(:has_many).collect{|r| r.name.to_s}
  end  

end

class Character < ActiveRecord::Base
  belongs_to :tab
  has_many :tabs, as: :tabable

 
  def initialize(character_params = {})

  	super character_params
# you only wish to add bars on the newly instantiated Foo instances
    if !self.tab.builds.empty?
      self.tab.builds.each{|build| self.tabs.build(tab_type: build.name)}
    end

  end
end

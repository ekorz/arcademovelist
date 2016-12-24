class Character < ActiveRecord::Base
  belongs_to :tab
  has_many :tabs, as: :tabable

  EDIT_FIELDS = [{column_name: :name , column_type: 'text_field'},
  				 {column_name: :description , column_type: 'text_field'}]
 
  def initialize(character_params = {})

  	super character_params

    if self.tab != nil

    if !self.tab.builds.empty?
      self.tab.builds.each{|build| self.tabs.build(tab_type: build.name)}
    end
  end
  end
end

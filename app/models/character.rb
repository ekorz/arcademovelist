class Character < ActiveRecord::Base
  belongs_to :tab
  has_many :tabs, as: :tabable, :order => 'position ASC', dependent: :destroy

  EDIT_FIELDS = [{column_name: :name , column_type: 'text_field'},
                 {column_name: :description , column_type: 'text_field'}]

  def initialize(character_params = {})

    super character_params

    if self.tab != nil #<!--this is what is blocking characters/builds errors -->

      if !self.tab.builds.empty?
        self.tab.builds.each{|build| self.tabs.build(tab_type: build.name, position: build.position)}
      end
    end
  end
end

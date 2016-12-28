class Note < ActiveRecord::Base
	belongs_to :tab

	EDIT_FIELDS = [{column_name: :description , column_type: 'text_field'}]

	
end

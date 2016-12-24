class Build < ActiveRecord::Base
	belongs_to :tab

	EDIT_FIELDS = [{column_name: :name , column_type: 'text_field'}]
end

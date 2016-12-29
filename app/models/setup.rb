class Setup < ActiveRecord::Base
	acts_as_list
	belongs_to :tab

	EDIT_FIELDS = [ {column_name: :kick_harness , column_type: 'check_box'},
					{column_name: :jamma , column_type: 'check_box'},
					{column_name: :button_layout , column_type: 'text_field'},
					{column_name: :region , column_type: 'text_field'}]
end

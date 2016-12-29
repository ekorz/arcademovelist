class Fatality < ActiveRecord::Base
  acts_as_list
  belongs_to :tab

  EDIT_FIELDS = [{column_name: :name , column_type: 'text_field'},
                 {column_name: :description , column_type: 'text_field'},
                 {column_name: :position , column_type: 'number_field'}]

end

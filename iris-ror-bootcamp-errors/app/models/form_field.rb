class FormField < ApplicationRecord
  belongs_to :form 

  has_many :form_field_option

  enum field_type: { 
    radio: 0, 
    checkbox: 1 , 
    text: 2 
  }  
  
end
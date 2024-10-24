class Answer < ApplicationRecord
  belongs_to :response
  belongs_to :form_field  

  scope :by_form_field  ,   -> (form_field_id) { where( form_field_id: form_field_id)}   

end

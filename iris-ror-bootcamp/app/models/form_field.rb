class FormField < ApplicationRecord
  belongs_to :form
  belongs_to :section
  has_many :answer  ,  dependent: :destroy
  has_many :form_field_option ,   dependent: :destroy  

  enum :field_type { 
    radio: 0 ,
    checkbox: 1 , 
    text: 2  
  }   
  

  scope :by_form , ->(form_id) {where( form_id: form_id  ) }  #selecting  by form_id  

  scope :by_field_type , ->(field_type) { where( field_type: field_type )}  

 end
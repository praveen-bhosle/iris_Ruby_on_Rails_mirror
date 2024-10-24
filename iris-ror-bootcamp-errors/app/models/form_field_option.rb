class FormFieldOption < ApplicationRecord  
    belongs_to :form_field   
    belongs_to :section  
end 

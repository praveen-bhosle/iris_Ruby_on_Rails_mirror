class Form < ApplicationRecord 
=begin 
    has_many :form_field     
    has_many :response    

     was unable to destroy the form , found out that when model has 'has_many' then 
     I had to use , "dependent: :destroy" which tells the ruby to delete the associated records  , when this will be destoyed  
=end  
 
has_many :form_field  , dependent: :destroy
has_many :response  , dependent: :destroy  
has_many :section , dependent: :destroy  

scope :recent, -> { order(created_at: :desc)}   
#scope :by_title, ->(title) {where('name ILIKE ?' ,  "%#title%" )} --> not working 

end

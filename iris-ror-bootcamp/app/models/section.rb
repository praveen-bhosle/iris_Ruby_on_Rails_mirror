class Section < ApplicationRecord 
    belongs_to :form 
    has_many :form_fields ,  dependent: :destroy
    has_many :responses  , dependent: :destroy
end

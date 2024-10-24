class Section < ApplicationRecord 
    belongs_to :form 
    has_many :form_field   dependent: :destroy
    has_many :response  , dependent: :destroy
end

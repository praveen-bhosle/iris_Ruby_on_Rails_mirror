class Response < ApplicationRecord
  belongs_to :form 
  belongs_to :section  , optional: true 
  has_many :answers  , dependent: :destroy  
  accepts_nested_attributes_for :answers
end 

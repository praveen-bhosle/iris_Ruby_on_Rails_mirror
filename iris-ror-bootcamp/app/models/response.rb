class Response < ApplicationRecord
  belongs_to :form 
  belongs_to :section 
  has_many :answer  , dependent: :destroy 
end 

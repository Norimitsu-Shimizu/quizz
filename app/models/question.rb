class Question < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :answers
  accepts_nested_attributes_for :answers
  
end

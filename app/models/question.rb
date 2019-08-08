class Question < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :answers
  accepts_nested_attributes_for :answers

  validates :title, presence: true
  validates :user_id, presence: true
  validates :genre_id, presence: true
  
end

class Card < ActiveRecord::Base
  # Ron validations
  validates :question, presence: true
  validates :answer, presence: true

  belongs_to :deck
  has_many :guesses
end

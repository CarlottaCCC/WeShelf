class Review < ApplicationRecord
  has_many :flags, dependent: :destroy
  belongs_to :book
  belongs_to :user
  validates :testo, presence: true, length: { minimum: 10 }
  validates :ranking, presence: true, numericality: {in: 0..10}
end

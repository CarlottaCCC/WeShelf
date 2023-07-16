class Chapter < ApplicationRecord
  belongs_to :book
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :delete_all
  validates :testo, presence: true, length: { minimum: 20 }
  validates :titolo, presence: true
  acts_as_votable
end

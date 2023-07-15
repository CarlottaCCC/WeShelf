class Chapter < ApplicationRecord
  belongs_to :book
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :delete_all

  acts_as_votable
end

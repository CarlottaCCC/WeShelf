class Review < ApplicationRecord
  has_many :flags, dependent: :destroy
  belongs_to :book
  belongs_to :user
end

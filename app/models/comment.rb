class Comment < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
 
end

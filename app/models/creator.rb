class Creator < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  has_many :upvotes
end

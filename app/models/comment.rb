class Comment < ApplicationRecord
  validates :content, presence: true, length: {maximum: 120}

  belongs_to :account
  belongs_to :shop
end

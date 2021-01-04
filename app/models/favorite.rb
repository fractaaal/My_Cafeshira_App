class Favorite < ApplicationRecord
    belongs_to :account
    belongs_to :shop
    validates_uniqueness_of :shop_id, scope: :account_id
end

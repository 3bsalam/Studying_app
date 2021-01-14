class Card < ApplicationRecord
    belongs_to :list
    belongs_to :user
    has_many :comments
end

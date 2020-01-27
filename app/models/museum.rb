class Museum < ApplicationRecord
    validates :name, :location, presence: true
    has_many :reviews
    has_many :users, through: :reviews
end

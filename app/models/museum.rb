class Museum < ApplicationRecord
    validates :name, :location, presence: true
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
end

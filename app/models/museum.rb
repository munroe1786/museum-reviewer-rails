class Museum < ApplicationRecord
    validates :name, :location, presence: true
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
end

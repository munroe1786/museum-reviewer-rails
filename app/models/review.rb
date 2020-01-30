class Review < ApplicationRecord
    validates :date_visited, :content, presence: true
    validates :rating, inclusion: { in: 1..10, message: "Rating must be between 1 and 10" }
    belongs_to :user
    belongs_to :museum

    #Review.order(rating: :desc)

    #scope :review_order, where(:rating => desc)

    #def self.review_order
        #order('rating desc').first
    #end
end

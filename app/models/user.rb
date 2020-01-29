class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :museums, through: :reviews
  has_many :reviewed_museums, through: :reviews, source: :museum
  validates :username, presence: true, uniqueness: true, length: {minimum: 5}, on: :create
end

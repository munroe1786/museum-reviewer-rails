class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
  has_many :reviews
  has_many :museums, through: :reviews
  has_many :reviewed_museums, through: :reviews, source: :museum
  validates :username, presence: true, uniqueness: true, length: {minimum: 5}, on: :create
end

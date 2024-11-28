class User < ApplicationRecord
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

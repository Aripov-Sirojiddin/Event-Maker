class User < ApplicationRecord
  has_many :events

  has_many :attendees
  has_many :attending_events, through: :attendees, source: :event

  has_many :invitiations
  has_many :invited_events, through: :invitiations, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

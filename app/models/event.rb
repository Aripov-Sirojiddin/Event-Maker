class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :invitiations
  has_many :invited_users, through: :invitiations, source: :user
end

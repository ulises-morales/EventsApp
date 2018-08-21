class Event < ApplicationRecord
  belongs_to :user
  has_many :atendees, dependent: :destroy
  has_many :users, through: :atendees

  validates :name, :date, :city,  presence: true
end

class Event < ApplicationRecord
  belongs_to :user
  has_many :participants, inverse_of: :event, dependent: :destroy
  accepts_nested_attributes_for :participants
  validates :title, :amount, presence: true
end

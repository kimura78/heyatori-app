class Room < ApplicationRecord
  validates_presence_of :name, :day
  validates :name, length: { maximum: 10 }

  belongs_to :user
  belongs_to :group
  has_many :timetables, dependent: :destroy
end

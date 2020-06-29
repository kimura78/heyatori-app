class Group < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :invites
  has_many :invites, dependent: :destroy
  has_many :rooms
end

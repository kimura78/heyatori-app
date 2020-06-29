class Room < ApplicationRecord
  validates_presence_of :name, :day

  belongs_to :user
  belongs_to :group
end

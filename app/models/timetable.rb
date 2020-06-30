class Timetable < ApplicationRecord
  validates_presence_of :start_time, :end_time

  belongs_to :room
  belongs_to :user
end

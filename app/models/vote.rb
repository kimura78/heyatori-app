class Vote < ApplicationRecord
  validates :timetable_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :timetable
end

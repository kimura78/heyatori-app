class User < ApplicationRecord
  has_many :groups, through: :invites
  has_many :invites, dependent: :destroy
  has_many :rooms
  has_many :timetables
  has_many :votes, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

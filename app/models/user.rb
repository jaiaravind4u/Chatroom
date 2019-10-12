class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_person_name

  has_many :chatarea_users
  has_many :chatareas, through: :chatarea_users
  has_many :messages
end

class ChatareaUser < ApplicationRecord
  belongs_to :chatarea
  belongs_to :user

  def self.names
    User.where(id: self.pluck(:user_id)).pluck(:first_name).join(", ")
  end
end
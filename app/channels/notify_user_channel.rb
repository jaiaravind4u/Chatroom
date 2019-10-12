class NotifyUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end

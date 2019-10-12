class ChatareasChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatareas.each do |chatarea|
      stream_from "chatareas:#{chatarea.id}"
    end
  end

  def unsubscribed
    # stop_all_streams
  end

  def speak(data)
    chatarea = Chatarea.find(data["chatarea_id"])
    chatarea.messages.create(user: current_user, body: data["body"]) unless chatarea.nil?
  end
end

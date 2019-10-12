class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message, current_user_id)
    ActionCable.server.broadcast "chatareas:#{message.chatarea.id}", {
      message: MessagesController.render(message, locals: {current_user: nil}),
      chatarea_id: message.chatarea.id,
      current_user_id: current_user_id,
      username: message.user.name,
      message_id: message.id,
      short_message: message.chatarea.short_display_message.html_safe,
      is_auto_generated: message.is_auto
    }
  end
end

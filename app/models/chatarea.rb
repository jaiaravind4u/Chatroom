class Chatarea < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    has_many :chatarea_users, dependent: :destroy
    has_many :users, through: :chatarea_users, dependent: :destroy
    has_many :messages, dependent: :destroy

    def short_display_message
        message = self.messages.where(is_auto: false).last
        return "<b>#{message.user.name}</b>: #{message.body[0..20]+"..."}" unless message.nil?
        "No conversation made"
    end

    def auto_reply_and_notifiy_offline_user(user, message)
        self.messages.create(user_id: user.id, body: "Users are currently offline", is_auto: true)
        to_user_ids = self.chatarea_users.pluck(:user_id) - [message.user.id]
        NotificationRelayJob.perform_later(to_user_ids, message.user.name, message.chatarea.name, message.short_message)
    end
end

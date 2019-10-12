class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_chatarea

    def create
        message = @chatarea.messages.new message_params
        message.user_id = current_user.id
        
        message.save
    end

    def ping
        message = @chatarea.messages.find(params[:message_id])
        @chatarea.auto_reply_and_notifiy_offline_user(current_user, message) if is_inactive?(message)
    end

    private 

    def set_chatarea
        @chatarea = Chatarea.find(params[:chatarea_id])
    end

    def message_params
        params.require(:message).permit(:body)
    end

    def is_inactive?(message)
        message.id == @chatarea.messages.last.id && @chatarea.chatarea_users.count > 0
    end
end
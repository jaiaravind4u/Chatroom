class ChatareaUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_chatarea

    def create
        if @chatarea.chatarea_users.count < @chatarea.user_limit
            @chatarea_user = @chatarea.chatarea_users.where(user: current_user.id).first_or_create
            flash[:notice] = "You have joined #{@chatarea.name} channel"
            redirect_to chatareas_path
        else
            flash[:error] = "Maximum users joined !"
            redirect_to chatareas_path
        end
    end

    def destroy
        @chatroom_user = @chatarea.chatarea_users.where(user_id: current_user.id).destroy_all
        redirect_to chatareas_path
    end

    private

    def set_chatarea
        @chatarea = Chatarea.find(params[:chatarea_id])
    end
end
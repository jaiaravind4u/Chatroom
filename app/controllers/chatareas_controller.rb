class ChatareasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_chatarea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_chatarea_user!, except: [:index]

  # GET /chatareas
  # GET /chatareas.json
  def index
    @chatareas = Chatarea.includes(:chatarea_users)
    @common_words = Message.common_words
  end

  # GET /chatareas/1
  # GET /chatareas/1.json
  def show
    @messages = @chatarea.messages.order(created_at: :desc).limit(100).reverse
  end

  # GET /chatareas/new
  def new
    @chatarea = Chatarea.new
  end

  # GET /chatareas/1/edit
  def edit
  end

  # POST /chatareas
  # POST /chatareas.json
  def create
    @chatarea = current_user.chatareas.new(chatarea_params)

    respond_to do |format|
      if @chatarea.save
        @chatarea.chatarea_users.where(user_id: current_user.id).first_or_create
        format.html { redirect_to chatareas_path, notice: 'Chatarea was successfully created.' }
        format.json { render :show, status: :created, location: @chatarea }
      else
        format.html { render :new }
        format.json { render json: @chatarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatareas/1
  # PATCH/PUT /chatareas/1.json
  def update
    respond_to do |format|
      if @chatarea.update(chatarea_params)
        format.html { redirect_to @chatarea, notice: 'Chatarea was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatarea }
      else
        format.html { render :edit }
        format.json { render json: @chatarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatareas/1
  # DELETE /chatareas/1.json
  def destroy
    @chatarea.destroy
    respond_to do |format|
      format.html { redirect_to chatareas_url, notice: 'Chatarea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def prank
    @chatarea = Chatarea.find(params[:chatarea_id])
    1.upto(1000).each do |time|
      @chatarea.messages.create(user_id: current_user.id, body: "Woahh! This is fun...", is_auto: true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatarea
      @chatarea = Chatarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatarea_params
      params.require(:chatarea).permit(:name, :user_limit)
    end

    def authenticate_chatarea_user!
      redirect_to root_path if @chatarea.chatarea_users.find_by(user_id: current_user.id).nil?
    end
end

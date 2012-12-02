class ChatsController < ApplicationController

# POST /chats
  def create
    @chat = Chat.new
    @chat.from_user_id = current_user.id
    @chat.message = params[:message]
    @chat.game_id = params[:game_id]

    respond_to do |format|
      if @chat.save
        @all_chat_messages = Chat.where(:game_id => params[:game_id]).order("id asc")
        # for AJAX request
        format.js { @all_chat_messages }
      else
        format.json { render json }
      end
    end
  end

# GET /chats
  def index
    respond_to do |format|
      @all_chat_messages = Chat.where(:game_id => params[:game_id]).order("id asc")
      # for AJAX request
      format.js { @all_chat_messages }
    end
  end

end

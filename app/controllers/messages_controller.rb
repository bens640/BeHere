class MessagesController < ApplicationController
    before_action :set_post, except: :create

    def create

      @message = Message.new message_params

      @message.user_id = current_user.id

      if @message.save
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
      else
        flash[:alert] = "Check the message form, something went wrong."
        render root_path
      end
    end

    def new

    end


    def destroy
      @message = @post.messages.find(params[:id])

      @message.destroy
      flash[:success] = "message deleted :("
      redirect_to root_path
    end

    private
    def message_params
      params.
          require(:message).
          permit(:user_id, :message, :post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end




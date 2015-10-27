class GuestsController < ApplicationController
  # before_action :set_guest
  before_action :set_post, except: :create
  before_action :set_current_user
  def new

    @guest = Guest.new

  end

  def create
    @guest = Guest.new guest_params
    p params
    p '*'* 50
    p params[:id]
    p params[:post_id]
      if @guest.save
      flash[:success] = "You are now a guest"
      redirect_to :back
    else
     redirect_to  :back
      end
    else

  end

  def destroy
    @guest = Guest.find(@g)
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'You were removed from the Event.' }
    end
  end
  private
  def set_post
    @g = Guest.find(params[:id])
  end
  # def set_guest
  #   @guest = Guest.where(post_id: @post.id)
  # end
  def set_current_user
    @current_user = current_user
  end
  def guest_params
    params.require(:guest).permit(:user_id, :post_id)
  end
end

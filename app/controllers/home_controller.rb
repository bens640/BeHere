class HomeController < ApplicationController
  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search])
    else
      @posts = Post.all
    end
    @eat = Post.eat
    @explore = Post.explore
    @party = Post.party
    @today = Post.today
  end


  private
  def home_params
    params.require(:post).permit(:search)
  end
end

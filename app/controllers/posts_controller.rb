class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private
  
    def require_login
      unless current_user
        flash[:alert] = "You must be logged in to access this section."
        redirect_to new_user_session_path
      end
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end

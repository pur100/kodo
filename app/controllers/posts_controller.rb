class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new # needed to instantiate the form_for
  end

  def create
   @post = Post.new(post_params)
   @user = current_user
   @post.user = @user
    if @post.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @post.update(post_params)
    @post.save # needed to instantiate the form_for
    redirect_to post_path
  end

  def edit
  end

  def show
  end

  def destroy
    @user = current_user
    @post.destroy

    # no need for app/views/users/destroy.html.erb
    redirect_to user_path(@user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :location, :description, :seats, :picture, :speakers, :date, :user_id)
  end
end

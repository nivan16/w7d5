class PostsController < ApplicationController

  before_action :is_author?, only: [:edit, :update]

  def index
    @posts = Sub.find(params[:id])
    redirect_to sub_url(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) 
      redirect_to post_url(@post)
    else
      render :edit
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end

end
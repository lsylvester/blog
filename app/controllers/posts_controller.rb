class PostsController < ApplicationController
  before_filter :require_admin, except: [:show, :index]
  
  def index
    @posts = Post.order("created_at desc")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to(@post, notice: 'Post was successfully created.')
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, notice: 'Post was successfully updated.')
    else
      render "edit"
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_url)
  end
end

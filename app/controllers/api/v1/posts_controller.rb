class Api::V1::PostsController < ApplicationController
  skip_before_action :authorized

  def index
    @posts = Post.all
    if @posts
      render json: { posts: PostsSerializer.new(@posts) }, status: :ok
    else
      render json: { error: "Posts failed to load." }, status: :bad_request
    end
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      render json: { post: PostsSerializer.new(@post) }, status: :created
    else
      render json: { error: "Post failed to save. Please try again." }, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    if @post
      render json: { post: PostsSerializer.new(@post) }, status: :ok
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.save
      render json: { post: PostsSerializer.new(@post) }, status: :accepted
    else
      render json: { error: "Post failed to update. Please try again." }, status: :unprocessable_entity
    end
  end

  def destroy
    Post.destroy(params[:id])
    if Post.find_by_id(params[:id])
      render json: { error: "Post deletion failed. Please try again." }, status: :failure
    else
      render json: { message: "Post successfully deleted." }, status: :ok
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :image)
  end
end

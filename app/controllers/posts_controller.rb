class PostsController < ApplicationController

    before_action :find_post, only: [:update, :destroy]

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.create(post_params)
        render json: {message: "#{@post.title} was created"}
    end

    def update
        @post.update(post_params)
        render json: @post
    end

    def destroy
        @post.destroy
        render json: {message: "#{@post.title} was deleted"}
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title,:content)
    end
end

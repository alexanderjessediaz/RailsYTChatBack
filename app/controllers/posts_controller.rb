class PostsController < ApplicationController

    def index
        @posts = Post.all

        render json: @posts
    end

    def show
        @post = Post.find(params[:id])

        render json: @post
    end

    def create
        @post = Post.create(
            title: params[:title],
            content: params[:content]
        )
        render json: {message: "#{@post.title} was created"}

    end

    def update

    end

    def destroy
        @post = Post.find(params[:id])

        @post.destroy

        render json: {message: "#{@post.title} was deleted"}

    end
end

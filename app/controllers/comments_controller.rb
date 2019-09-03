class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:like]
    
    def new
        @comment = Comment.new
    end

    def create
        @comment = @post.comments.new(comment_params)
        if @comment.save
            flash[:success] = "Comment Added Successfully"
            redirect_to @post
        else
            render 'new'
        end
    end

    def like
        @comment.increment!(:like_count)
        redirect_to @post
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :username)
    end
end

class CommentsController < ApplicationController
    before_action :set_post
    
    def new
        @comment = Comment.new
    end

    def create
        @comment = @post.comments.new({content: 'hassan comment', username: 'hassan'})
        if @comment.save
            flash[:success] = "Comment Added Successfully"
            redirect_to @post
        else
            render 'new'
        end
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :username)
    end
end

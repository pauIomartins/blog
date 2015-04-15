class CommentsController < ApplicationController
    
    before_filter :load_article

    def create
        @comment = @article.comments.new(comment_params)
        if @comment.save
            redirect_to @article, :notice => 'Thanks for you commment!'
        else
            redirect_to @article, :alert => 'Unable to add commment!'
        end    
    end
  
    def destroy
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to @article, :alert => 'Comment deleted!'
    end
  
    private
        def comment_params
            params.require(:comment).permit(:commenter, :email, :body)
        end

        def load_article
            @article = Article.find(params[:article_id])
        end
end

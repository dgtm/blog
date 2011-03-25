class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    if @comment.save
        redirect_to(post_path(@post),:notice =>'Your comment has been  added')
        else
         redirect_to(post_path(@post), :alert =>'Unable to add post')
        end
  end

end

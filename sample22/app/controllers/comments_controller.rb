class CommentsController < ApplicationController
  
  before_filter :load_post

  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to @post
  end

  protected

  def load_post
    @post = Post.find(params[:post_id]) if params[:post_id]
  end
end

class CommentsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"

      respond_to do |format|
        format.html {redirect_to blog_path(@comment.blog)}
        format.js
      end

    else
      render :new
    end
  end


  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(comment_params)
    render :edit
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment= Comment.find(params[:id])
    if @comment.update(params[:comment])
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end


  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted."
    redirect_to blog_path(@blog)
  end

private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end

end

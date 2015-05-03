class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.all
    render :index
  end

  def show
    @blog = Blog.find(params[:id])
    render :show
  end

  def new
    @blog = Blog.new
    render :new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path

      Pusher['blogsChannel'].trigger('new-blog', {
        blog: @blog
      })
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    render :edit
  end

  def update
    @blog= Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path

      Pusher['blogsChannel'].trigger('new-blog', {
        blog: @blog
      })
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "Blog successfully deleted."
    redirect_to blogs_path

    Pusher['blogsChannel'].trigger('delete-blog', {
      blog: @blog
    })

  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end

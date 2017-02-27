class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def create
    user = current_user
    
    blog = Blog.create(blog_params)
    if blog.save
      redirect_to user
    else
      flash[:message] = 'Invalid'
      redirect_to user
    end
  end 
  
  
  def edit
  end
  
  def update
    @blog.update(blog_params)
    redirect_to current_user
  
  end
  
  def destroy
    user = current_user
    @blog.destroy
    redirect_to user
    
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end 
  
  def set_blog
   @blog = Blog.find(params[:id])
  
  end
end

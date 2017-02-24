class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def create
    user = current_user
    
    blog = Blog.create(blog_params)
    if blog.save
      puts blog.inspect
      redirect_to user
    else
      flash[:message] = 'Invalid'
      redirect_to user
    end
  end 
  
  
  def edit
  end
  
  def update
    puts '/'*80
    puts blog_params
    puts '/'*80
    blog = Blog.find(12)
    blog.update(blog_params)
    puts 'blogs_controller.update:', blog
   
    redirect_to current_user
  
  end
  
  def destroy
    user = current_user
    @blog.destroy
    redirect_to user
    
  end
  
  private
  
  def blog_params
    params[:blog].permit(:title, :content, :user_id)
  end 
  
  def set_blog
    puts @blog.inspect
    @blog = Blog.find(params[:id])
    puts @blog.inspect
  end
end

class PostsController < ApplicationController
  before_filter :check_title, :only=>[:create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html {redirect_to(posts_path,:notice =>'New post Added')}
      else
        format.html{render :action=>"new", :alert =>'unable to add post'}
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    end

    def show_by_title
      @posts=Post.order_by_title
      render :action => "index"
    end

  def latest_index
     @posts = Post.latest
     render :action => "index"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path,:notice =>'Post deleted')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        redirect_to(@post, :notice => 'Updated post')
      else
       render :action => "edit", :notice => "Unable to update post"
    end
  end

   def check_title
     p params[:post][:title].length
     if params[:post][:title].length < 25  #--ERROR : NOT WORKING latest var
     return false
   else
     return true
     end
   end

end

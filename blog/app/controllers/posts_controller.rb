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
    @post = Post.all
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path,:notice=>'Post deleted')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Updated post') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

   def check_title
     if params[:post][:title].length > 19  #--ERROR : NOT WORKING
     return false
   else
     return true
     end
   end
end

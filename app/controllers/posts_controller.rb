class PostsController < ApplicationController
  def index
      #@をつける事でテンプレートに直接渡せる
     @posts=Post.all
  end
  
  def show
     @post=Post.find_by(id:params[:id])
  end
  
  def new
  end
end

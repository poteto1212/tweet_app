class PostsController < ApplicationController
  def index
      #@をつける事でテンプレートに直接渡せる
    @posts=Post.all.order(created_at: :desc)
  end
  
  def show
    @post=Post.find_by(id: params[:id])
  end
  
  def new
  end
  
  
  #コメント入れるときは全角要注意！
  def create
    #データベースへの保存
    @post=Post.new(content:params[:content])
    @post.save
    #テンプレートがないのでリダイレクト
    redirect_to("/posts/index")#対応ビューがないのでリダイレクトさせる
  end
  #編集アクション
  def edit
      @post=Post.find_by(id: params[:id])
  end
  
  #更新アクション
  def update
    key=params[:id]
    @post=Post.find_by(id: key)
    @post.content=params[:content]
    
    if @post.save==true
        redirect_to("/posts/index")
    else @post.save==false
        #rnderを使うとeditアクションを経由せずにHTMLを表示できる
        #アクションは前までに表示されていたものに依存する。
        render("posts/edit")
        #redirect_to("/posts/#{@post.id}/edit")
    end
  end
  

  
  def verification
      @post=Post.find_by(id: params[:id])
  end
  
  #削除アクション
  def destory
      key=params[:id]
      @post=Post.find_by(id: key)
      @post.destroy
      redirect_to("/posts/index")
  end
end
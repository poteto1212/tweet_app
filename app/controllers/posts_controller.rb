class PostsController < ApplicationController
  #ログインしてない場合は全て弾く
  before_action :authenticate_user 
  before_action :ensure_current_user,{only:[:edit,:update,:destory]}
  def index
      #@をつける事でテンプレートに直接渡せる
    @posts=Post.all.order(created_at: :desc)
  end
  
  def show
    #投稿情報取得
    @post=Post.find_by(id: params[:id])
    #ユーザー情報取得
    @user=@post.user
  end
  
  def new
    @post=Post.new
  end
  
  
  #コメント入れるときは全角要注意！
  def create
    #データベースへの保存
    @post=Post.new(
    content: params[:content],
    user_id: @current_user.id#セッション中に含まれるユーザーIDをデフォルトで追加させる。
    )
    
    if @post.save
        flash[:notice]="投稿成功！"
        redirect_to("/posts/index")
    else
        render("posts/new")
    end
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
        flash[:notice]="投稿を編集しました"
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


  #ログインユーザーでなければ投稿を編集出来ないようにする

  def ensure_current_user
    @post=Post.find_by(id: params[:id])

    if @post.user_id != @current_user.id
      falsh[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
end

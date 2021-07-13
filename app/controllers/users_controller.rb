class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id: params[:id])
  end
  def new
    @user=User.new 
  end

  def create
    @user=User.new(name: params[:name],email: params[:email],image_name:'default_user.jpg',password: params[:password])
    if @user.save
      #登録情報をそのままセッションに飛ばす。
      session[:user_id]=@user.id
      flash[:notice]="ユーザー登録が完了しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    key=params[:id]
    @user=User.find_by(id: key)
  end

  def update
    key=params[:id]
    @user=User.find_by(id: key)
    @user.name=params[:name]
    @user.email=params[:email]
    #画像URLをデータベースに保存する処理
    @user.image_name="#{@user.id}.jpg"

    #画像の保存先の指定
    image=params[:image]
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
  
    if @user.save
      flash[:notice]="ユーザー名を編集しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end

  end
  #ログインページの表示
  def login_form
  end
  #ログインページの表示
  def login
    #ログインユーザーを特定する
    @user = User.find_by(email:params[:email],password:params[:password])
    #ユーザーが存在する時・・・
    if @user
      #session変数はブラウザに一次保持させる
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      #podtsファイルのindexメソッドに飛ぶ
      redirect_to("/posts/index")
    else
      #ユーザーが存在しない時は再表示
      @error_message="メールアドレスもしくはパスワードが間違っています"

      #間違えた時のデフォルト値
      @email=params[:email]
      @password=params[:password]
      render("users/login_form")
    end
  end

  #ログアウト処理
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました。"
    #ログイン画面に飛ぶ
    redirect_to("/login")
  end
end

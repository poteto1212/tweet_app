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
    @user=User.new(name: params[:name],email: params[:email],image_name:'default_user.jpg')
    if @user.save
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
end

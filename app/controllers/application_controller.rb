class ApplicationController < ActionController::Base
    #全てのテンプレートに共通する処理を書いていく。
    #全てのテンプレートに共通する処理を書いていく。
    #セッション情報をナブバーに渡す

    before_action :get_current_user
    def get_current_user
        @current_user=User.find_by(id: session[:user_id])
    end

    #ログインしてない状態では弾く
    def authenticate_user
        if @current_user == nil
            flash[:notice]="ログインが必要です"
            redirect_to("/login")
        end
    end

    #ログイン状態では弾く
    def forbid_login_user
        if @current_user
            flash[:notice]="既にログインしています"
            redirect_to("/posts/index")
        end
    end
    
end

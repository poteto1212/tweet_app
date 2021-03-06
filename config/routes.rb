Rails.application.routes.draw do
 #ログイン用ルーティング
    get "login"=>"users#login_form"
 #ログイン情報の送信処理
    post "logined"=>"users#login"


    #ログアウト
    post "logout"=>"users#logout"

    get 'users/index'
#ルーティングは送信されたurLに対するコントローラの対応表
#get URL => コントローラ#アクション
 
    get "/" => "home#top"
    get "about" => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#postコントローラ対応表
    get "posts/index" => 'posts#index' 
  #idを利用した動的ルーティング
    get "posts/new" => 'posts#new'
    get "posts/:id" => 'posts#show'
    post "posts/create" => 'posts#create'
    
    #編集アクション
    get 'posts/:id/edit' => "posts#edit"
    post 'posts/:id/update' => "posts#update"
    get "posts/:id/verification"=>"posts#verification"
    post 'posts/:id/destory' => "posts#destory"
  
#ホーム画面

    #ユーザー管理
    get "users/index" => "users#index"
    get "users/new"=>"users#new"
    get "users/:id"=>"users#show"
    #データベースへユーザー登録する
    post "users/create"=>"users#create"

    #ユーザー編集機能
    get "users/:id/edit"=>"users#edit"
    post "users/:id/update"=>"users#update"
end

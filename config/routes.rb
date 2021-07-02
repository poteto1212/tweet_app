Rails.application.routes.draw do
#ルーティングは送信されたurLに対するコントローラの対応表
#get URL => コントローラ#アクション
  get '/' => "home#top"
  get 'about' => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#postコントローラ対応表
  get 'posts/index' => 'posts#index' 
  #idを利用した動的ルーティング
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  
  #新規投稿作成画面
 
end

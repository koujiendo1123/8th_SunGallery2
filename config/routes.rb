Rails.application.routes.draw do
  get 'general_users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # 取り急ぎトップページを作成
  root 'top#index'
  
  # 絵画のルーティングを作成
  resources :paintings

  # 作者のルーティングを作成
  resources :authors

  # カスタムコントローラーにルーティング
  devise_for :general_users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: "general_users/registrations",
    sessions: "general_users/sessions",
    passwords: "general_users/passwords",
    confirmations: "general_users/confirmations"
  }
  get "general_users/profile" => "general_users#show"

end

Rails.application.routes.draw do
  get 'static_pages/terms'
  get 'general_users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # 取り急ぎトップページを作成
  root 'top#index'
  
  # 絵画のルーティングを一通り作成
  resources :paintings

  # 利用規約のルーティングを作成
  get 'terms', to: 'static_pages#terms'
  
  # プライバシポリシーのルーティングを作成
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  # 絵画の印刷用ルーティングを作成
  resources :paintings, only: [:show] do
    member do
      get :print_images
    end
  end

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

  # 画像アップロード用のルーティングを作成
  post "paintings/upload_image", to: "paintings#upload_image"

end

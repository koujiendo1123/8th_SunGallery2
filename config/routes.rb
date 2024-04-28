Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # 取り急ぎトップページを作成
  root 'top#index'
  # 絵画のルーティングを作成
  resources :paintings
end

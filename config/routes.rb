Rails.application.routes.draw do
  # namespace :public do
  #   get 'posts/new'
  #   get 'posts/index'
  #   get 'posts/edit'
  # end
  # namespace :public do
  #   get 'goods/index'
  #   get 'goods/show'
  # end
  # namespace :admin do
  #   get 'goods/new'
  #   get 'goods/index'
  #   get 'goods/show'
  #   get 'goods/edit'
  # end
  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root 'public/homes#top'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/confirm_withdraw' => 'public/customers#confirm_withdraw'
  patch '/customers/withdraw' => 'public/customers#withdraw'

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :events, only:[:new, :create, :index, :show, :edit, :update]
    resources :goods, only:[:new, :create, :index, :show, :edit, :update]
  end

  #ゲストログイン機能のroot
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resource :customers, only: [:show]
    resources :events, only: [:new, :create, :index, :show]
    resources :goods, only: [:index, :show]
    resources :posts, only: [:create, :new, :index] do
      resource :favorites, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

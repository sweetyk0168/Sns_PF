Rails.application.routes.draw do
  namespace :admin do
    get 'ticket_orders/index'
    get 'ticket_orders/show'
    get 'ticket_orders/new'
  end
  namespace :public do
    get 'ticket_orders/new'
    get 'ticket_orders/index'
    get 'ticket_orders/confirm'
    get 'ticket_orders/complete'
    get 'ticket_orders/create'
    get 'ticket_orders/show'
  end
  namespace :public do
    get 'cart_tickets/index'
  end
  namespace :public do
    get 'event_tickets/index'
    get 'event_tickets/show'
  end
  namespace :admin do
    get 'event_tickets/new'
    get 'event_tickets/index'
    get 'event_tickets/show'
    get 'event_tickets/edit'
  end
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
    resources :event_tickets, only:[:create, :new, :index, :show, :edit, :update]
    resources :ticket_orders, only:[:index, :show, :update]
    resources :ticket_order_details, only:[:update]
  end

  #ゲストログイン機能のroot
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resources :customers, only: [:index, :show] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
    resources :events, only: [:new, :create, :index, :show]
    resources :goods, only: [:index, :show]
    resources :posts, only: [:create, :new, :index, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
    end
    resources :event_tickets, only:[:index, :show, :new]
    resources :cart_tickets, only:[:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :ticket_orders, only:[:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

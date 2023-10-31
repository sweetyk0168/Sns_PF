Rails.application.routes.draw do
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
    resources :event_repos, only:[:create, :new, :index, :show, :edit, :update]
    resources :event_questionnaires_questions, only:[:create, :new, :index, :show]
    resources :event_questionnaires_answers, only:[:create, :new, :index, :show]
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
    resources :event_repos, only:[:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

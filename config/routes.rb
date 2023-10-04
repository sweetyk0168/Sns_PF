Rails.application.routes.draw do

  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :public do
  #   get 'homes/top'
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

  #ゲストログイン機能のroot
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

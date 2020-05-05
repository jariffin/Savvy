Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'score_information', to: 'pages#score_information'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :garments, only: [ :new, :create, :show, :index, :update ] do
    resources :purchases, only: [ :new ]
    resources :blends, only: [ :new, :create ]

    collection do
      get 'scan'
    end
  end

  resources :purchases, only: [ :index, :destroy ]
  resources :materials, only: [ :index, :show ]

end

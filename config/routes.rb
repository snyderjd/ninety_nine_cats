Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show]
  # resources :artworks, only: [:create, :destroy, :show, :update]
end

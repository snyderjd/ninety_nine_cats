Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show, :new, :create, :edit, :update]
  # resources :artworks, only: [:create, :destroy, :show, :update]
end

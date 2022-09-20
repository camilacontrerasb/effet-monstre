Rails.application.routes.draw do
  resources :clients, only: [:index, :new, :show, :edit, :destroy]
end

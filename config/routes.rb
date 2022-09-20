Rails.application.routes.draw do
  get "clients", to: "clients#index"
  post 'clients', to: 'clients#create'
  get 'clients/new', to: 'clients#new', as: :new_task
  get 'clients/:id', to: 'clients#show', as: :task
  get 'clients/:id/edit', to: 'clients#edit', as: :edit_task
  patch 'clients/:id', to: 'clients#update'
  delete 'clients/:id', to: 'clients#destroy'
end

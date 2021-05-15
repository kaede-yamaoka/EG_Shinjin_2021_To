Rails.application.routes.draw do
  root "top#index"

  resources :members do
    get "search", on: :collection
  end
end

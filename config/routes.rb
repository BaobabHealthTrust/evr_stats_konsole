Rails.application.routes.draw do
  get 'news/index'

  get 'landing/index'
  post '/', to: 'landing#index'

  get 'dashboard/index'

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

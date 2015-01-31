Rails.application.routes.draw do
  devise_for :users

  root :to => 'lamps#client'

  scope '/api' do
    get 'register' => 'lamps#register'
    get 'ping/:number' => 'stages#ping'
    resources :lamps
  end

end

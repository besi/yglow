Rails.application.routes.draw do
  devise_for :users

  root :to => 'lamps#client'

  scope '/api' do
    get 'register' => 'lamps#register'
    get 'ping/:number' => 'stages#ping'
    get 'color/:color' => 'stages#color'
    resources :lamps
  end

end

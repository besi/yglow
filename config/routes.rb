Rails.application.routes.draw do
  devise_for :users

  root :to => 'lamps#client'

  scope '/api' do
    get 'register' => 'lamps#register'
    resources :lamps
  end

end

Rails.application.routes.draw do

devise_for :users, controllers: { registrations: "registrations" }

resources :users

get 'welcome/index'

get 'welcome/about'

root 'welcome#index'

end

Rails.application.routes.draw do
  namespace :admin do
    root "profile#index"

    get "logs/from_controllers", to: "logs#from_controllers"

    get    'session', to: "session#index"
    post   'session', to: "session#create"
    delete 'session', to: "session#destroy"
  end
  
  root 'converter#index'
end

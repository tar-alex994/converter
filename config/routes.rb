Rails.application.routes.draw do
  namespace :admin do
    root "profile#index"

    get "logs/from_controllers",     to: "logs#from_controllers"
    get "logs/from_controllers/all", to: "logs#from_controllers_all"
    get "logs/from_file",            to: "logs#from_file"
    get "logs/from_file/all",        to: "logs#from_file_all"

    get    'session', to: "session#index"
    post   'session', to: "session#create"
    delete 'session', to: "session#destroy"
  end
  
  root 'converter#index'

  resources :products do
    member do
      get  "add_photo", action: :add_photo_form
      post "add_photo"
    end
  end
end

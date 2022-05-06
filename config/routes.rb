Rails.application.routes.draw do
  namespace :admin do
    get    'session', to: "session#index"
    post   'session', to: "session#create"
    delete 'session', to: "session#destroy"
  end
  
  root 'converter#index'
end

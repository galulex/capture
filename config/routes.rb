Capture::Application.routes.draw do
  root 'welcome#index'

  resources :videos
end

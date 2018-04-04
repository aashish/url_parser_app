Rails.application.routes.draw do
  jsonapi_resources :html_tags
  jsonapi_resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "currencies#symbols"
  get "currencies/symbols" => "currencies#symbols", as: :symbols
  get "currencies/latest" => "currencies#latest", as: :latest
  get "currencies/convert" => "currencies#convert", as: :convert
  get "currencies/fluctuation" => "currencies#fluctuation", as: :fluctuation
end

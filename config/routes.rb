Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'home/index'
    resources :posts
    root 'static_pages#home', as: "home"
    get 'static_pages/help', as: "help"

    get "/signup", to: "users#new"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"

    resources :users, except: %i(new)
  end
end

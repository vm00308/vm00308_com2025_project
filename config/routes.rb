Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root 'welcome#home'
    get 'about', to: 'welcome#about'
    get 'contact', to: 'welcome#contact'
    post 'request_contact', to: 'welcome#request_contact'

    resources :recipes

    get 'signup', to: 'users#new'
    resources :users, except: [:new]

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    resources :categories
  
  end
  
end

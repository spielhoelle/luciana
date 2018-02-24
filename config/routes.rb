Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

    resources :photos, only: [:index, :show]

  namespace :admin do
    resources :contacts do
      collection do
        get 'remove_all'
      end
    end
    

    resources :photos do
      get :autocomplete_category_title, on: :collection
      get :autocomplete_tag_title, on: :collection
    end

    resources :tags
    resources :categories
    root to: "photos#index"
  end
  match '/contacts/new', to: 'contacts#create', via: 'post'
  resources 'contacts', only: [:new, :create]

end

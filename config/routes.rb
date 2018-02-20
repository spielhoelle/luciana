Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :admin do
    resources :contacts do
      collection do
        get 'remove_all'
      end
    end
    resources :photos

    resources :posts do
      get :autocomplete_category_title, on: :collection
      get :autocomplete_tag_title, on: :collection
    end
    resources :comments

    resources :tags
    resources :categories
    resources :post_images
    post '/upload_from_url' => 'post_images#update'
    root to: "photos#index"
  end
  match '/contacts/new', to: 'contacts#create', via: 'post'
  resources 'contacts', only: [:new, :create]

  resources :posts
  resources :comments, only: :create
end

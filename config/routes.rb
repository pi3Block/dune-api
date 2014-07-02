Neighborly::Api::Engine.routes.draw do
  scope module: :v1,
        constraints: Neighborly::Api::ApiConstraint.new(revision: 1, default: true),
        defaults: { format: :json } do

    resources :projects
    resources :tags

    get    'users/:id', to: 'users#show'
    post   'sessions',  to: 'sessions#create'
    delete 'sessions',  to: 'sessions#destroy'
  end
end

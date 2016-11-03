Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql/queries'

  root to: redirect('/graphiql')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :coffee_bean, only: [:index, :show] do
      resources :supplier, only: :index
    end
  end

  namespace :graphql do
    get  'queries' => 'query#queries'
    post 'queries' => 'query#queries'
  end
end

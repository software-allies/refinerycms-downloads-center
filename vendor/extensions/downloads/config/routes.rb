Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :downloads do
    resources :downloads, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :downloads, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :downloads, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

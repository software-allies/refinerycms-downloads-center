Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :categories do
    resources :categories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :categories, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :categories do
    resources :downloads, :only => [:index, :show]
  end

  # Admin routes
  namespace :categories, :path => '' do
    namespace :admin, :path => 'refinery/categories' do
      resources :downloads, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :categories do
    resources :subcategories, :only => [:index, :show]
  end

  # Admin routes
  namespace :categories, :path => '' do
    namespace :admin, :path => 'refinery/categories' do
      resources :subcategories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

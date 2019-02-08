Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"},
              path: '', path_names: { sign_in: 'login',
                                      sign_out: 'logout',
                                      sign_up: 'register' }



                                 
  resources :series do
    mount Ckeditor::Engine => '/ckeditor'
    resources :videos, only: [:show]
  end
  get 'search_letters/:letter', to: 'series#get_letters', as: 'search_letters'
  get 'category/:category', to: 'series#get_by_category', as: 'category'
  get 'search_serie_movie', to: 'series#search_serie_movie', as: 'search_serie_movie'
  root 'series#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get 'series/index'
      get 'series/search'
    end
  end

  match '*unmatched_route', :to => 'application#routing', via: [:all]
end

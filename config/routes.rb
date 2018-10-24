Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"},
              path: '', path_names: { sign_in: 'login',
                                      sign_out: 'logout',
                                      sign_up: 'register' }



                                 
  resources :series do
    collection do
      get :search_data
    end
    mount Ckeditor::Engine => '/ckeditor'
    resources :videos, only: [:show]
  end
  get 'search_letters/:letter', to: 'series#get_letters', as: 'search_letters'
  get 'category/:category', to: 'series#get_by_category', as: 'category'
  get 'search_serie_movie', to: 'series#search_serie_movie', as: 'search_serie_movie'
  root 'series#index'
  match '*unmatched_route', :to => 'application#routing', via: [:all]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

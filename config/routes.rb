Rails.application.routes.draw do
  resources :ailments, only: [:new, :create, :destroy]
  resources :prescriptions, only: [:new, :create, :edit, :update, :destroy]
  resources :patients, only: [:show]
  resources :appointments
  resources :specialties, only: [:index, :show] do
    resources :doctors, only: [:new, :create, :edit, :update, :show, :destroy]
  end
  get '/doctors_index', to: 'doctors#index', as: 'doctors'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/doctor_signup', to: 'doctor_signup#new', as: 'doctor_signup'
  post '/doctor_signup', to: 'doctor_signup#create'
  get '/doctor_edit', to: 'doctor_signup#edit', as: 'doctor_edit'
  patch '/doctor_edit', to: 'doctor_signup#update'
  get '/patient_signup', to: 'patient_signup#new', as: 'patient_signup'
  post '/patient_signup', to: 'patient_signup#create'
  get '/patient_edit', to: 'patient_signup#edit', as: 'patient_edit'
  patch '/patient_edit', to: 'patient_signup#update'
  post '/resolve_ailment', to: 'ailments#resolve_ailment'
  post '/unresolve_ailment', to: 'ailments#unresolve_ailment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

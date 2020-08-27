Rails.application.routes.draw do
  # get 'employees/index'
  # get 'employees/show'
  # get 'employees/new'
  # get 'employees/edit'
  # get 'employees/create'
  # get 'employees/update'
  # get 'employees/destroy'
  # get 'attendances/index'
  # get 'attendances/show'
  # get 'attendances/new'
  # get 'attendances/edit'
  # get 'attendances/create'
  # get 'attendances/update'
  # get 'attendances/destroy'
  # get 'companies/index'
  # get 'companies/show'
  # get 'companies/new'
  # get 'companies/edit'
  # get 'companies/create'
  # get 'companies/update'
  # get 'companies/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :employees, shallow: true
  end

  resources :attendances

  root 'companies#index'
end

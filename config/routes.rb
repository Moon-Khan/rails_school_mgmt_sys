  # devise_scope :user do
  #   get "/users/profile", to: "users/registrations#profile", as: :user_profile
  #   patch "/users/update_password", to: "users/registrations#update_password", as: :update_user_password
  #   delete "/users/deactivate", to: "users/registrations#deactivate", as: :deactivate_user
  # end
  
    # devise_for :students


Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
 
  }

  # Profile route
  devise_scope :user do
    get "users/profile", to: "users/registrations#profile", as: :user_profile
  end
  
  # Dashboard routes for roles
  get "/admin_dashboard", to: "admin#dashboard", as: :admin_dashboard


  get '/students', to: 'students#index', as: 'index_students'

  get '/students/new', to: 'students#new', as: 'new_student' 

  post '/students', to: 'students#create'

  get '/students/:id', to: 'students#show', as: 'student'

  get '/students/:id/edit', to: 'students#edit', as: 'edit_student'

  patch '/students/:id', to: 'students#update'

  delete 'students/:id', to:'students#destroy'
  

  get '/teachers', to: 'teachers#index', as: 'index_teachers'

  get '/teachers/new', to: 'teachers#new', as: 'new_teacher' 

  post '/teachers', to: 'teachers#create'

  get '/teachers/:id', to: 'teachers#show', as: 'teacher'

  get '/teachers/:id/edit', to: 'teachers#edit', as: 'edit_teacher'

  patch '/teachers/:id', to: 'teachers#update'

  delete 'teachers/:id', to:'teachers#destroy'
  


  get '/courses', to: 'courses#index', as: 'index_courses'

  get '/courses/new', to: 'courses#new', as: 'new_course' 

  post '/courses', to: 'courses#create'

  get '/courses/:id', to: 'courses#show', as: 'course'

  get '/courses/:id/edit', to: 'courses#edit', as: 'edit_course'

  patch '/courses/:id', to: 'courses#update'

  delete 'courses/:id', to:'courses#destroy'
  

end

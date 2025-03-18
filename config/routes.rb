Rails.application.routes.draw do

  root "students#index"

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

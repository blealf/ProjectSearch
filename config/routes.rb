Rails.application.routes.draw do



  get 'staffs/:id/supervision' => 'staffs#supervision', :as => :staff_supervision
  get 'students/:id/supervisor' => 'students#supervisor', :as => :student_supervisor

  resources :allocations
  resources :supervision_types
  resources :feedbacks, only: [:index, :new, :create, :destroy]

  resources :allprojectapplications

  resources :allprojectsuggestions



  #resources :password_resets, only: [:new, :create, :edit, :update]

  #resources :applicationreplies

  resources :studentapplications

    resources :project_applications do
      resources :applicationreplies
      resources :archives
    end

  resources :project_suggestions do
    resources :suggestionreplies 
  end
  resources :archives
  get 'project_applications/:id/applicationreplies' => 'project_applications#show', :as => :application_reply
  get 'project_suggestions/:id/suggestionreplies' => 'project_suggestions#show', :as => :suggestion_reply
  
  resources :studentsuggestions
  resources :abouts
  resources :helps

  resources :shortlists


  resources :admins
  resources :departments
  resources :faculties
  resources :project_tags
  resources :categories
  resources :levels

  # resources :admins do 
  #   resources :departments
  #   resources :faculties
  #   resources :project_tags
  #   resources :categories
  #   resources :levels
  # end
  


  resources :students
  resources :staffs
  #resources :projects
  
  resources :projects do 
    resources :shortlists
    resources :project_applications
  end

  resources :courses


  #get "/shortlist" => "shortlists#new", :as => :shortlists
  #post "/shortlist" => "shortlists#create" :as => :create_shortlist



  # ----------------------------------------------------------
  # -------------------- SPECIFIC ROUTES ---------------------
  # ----------------------------------------------------------

  #categories
  get 'categories/:id' => 'categories#show'
  get 'categories/:id/projects' => 'categories#show', :as => :category_projects

  #session
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #staff
  get '/staff_signup', to:  'staffs#new'
  get 'staffs/:id' => 'staffs#show'
  get 'staffs/:id/projects' => 'staffs#projects', :as => :staff_projects

  #students
  get '/student_signup', to:  'students#new'
  get 'students/:id' => 'students#show'
  #for student project recommendation
  get 'students/course/:id' => 'students#course', :as => :student_course
  
  #for student project suggestions
  #project_suggestions
  get 'project_suggestions/:id' => 'project_suggestions#show'
  get 'staffs/:id/project_suggestions' => 'staffs#project_suggestions', :as => :student_projects
  get 'staffs/:id/project_applications' => 'staffs#project_applications', :as => :student_applications

  #project application
  #get 'project_applications/:student_id/edit' => 'project_applications#edit', :as => :reply_project_applications

  #project_tags
  get 'project_tags/:id' => 'project_tags#show'

  #courses
  get 'courses/:id/projects' => 'courses#show', :as => :course_projects

  #level
  get 'levels/:id/projects' => 'levels#show', :as => :level_projects

  #
  #projects
  get 'projects/:id' => 'projects#show'
  


  #root
  get '/projects/projecthome' => 'projects#projecthome'
  root 'projects#projecthome'
  #root 'projects#index'


  
end
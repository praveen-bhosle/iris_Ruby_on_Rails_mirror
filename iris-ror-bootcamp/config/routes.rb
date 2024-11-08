Rails.application.routes.draw do  
  root "home_page#index"  
  devise_for :users  
  get 'login'    , to: 'home_page#login'  
  get 'register' , to: 'home_page#register' 
  get 'logout'   , to: 'home_page#logout' 
    resources :forms , only: [:index , :show , :new , :create  ,   :edit  ,:update    ] do 
        member do  
            get 'new_response'  
            get 'responses' 
            get 'deleteform'
        end 
    end 
    resources :responses  , only: [:index , :create  ]       
end  
Rails.application.routes.draw do 

    resources :forms , only: [:index , :show] do 
        member do  
            get 'new_response'  
            get 'responses' 
        end 
    end 
    
    resources :responses  , only: [:index , :create]     

end 
 


   

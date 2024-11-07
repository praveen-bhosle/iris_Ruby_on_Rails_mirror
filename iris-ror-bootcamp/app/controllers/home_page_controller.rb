class HomePageController < ApplicationController 
  
  def index 
    if user_signed_in? 
    @forms = Form.all  
    @public_forms  = @forms.where(public: true)
    @private_forms = @forms.where(public: false) 
    @my_forms  = @forms.where( user_id: current_user.id )   
    else 
      @forms = Form.all
      @public_forms  = @forms.where(public: true)  
    end 
  end   

  def login 
    redirect_to  new_user_session_path
  end 

  def register 
    redirect_to new_user_registration_path
  end 

  def logout 
    sign_out(current_user) 
    redirect_to root_path 
  end 

  

end 

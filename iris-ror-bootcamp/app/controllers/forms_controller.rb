class FormsController < ApplicationController 
    
    load_and_authorize_resource 

    #before_action :set_form ,  only: [:show ,   :new_response]  

    def show  
        @form_details = @form  
        @form_fields = FormField.where(form_id: @form.id)     
    end 

    def index 
        #@forms = Form.all  
    end    

    def new_response  
        @response = @form.responses.build  

        @form_fields = FormField.where(form_id: @form.id )  
        
        

        @form_fields.each do |form_field| 
            @response.answers.build(form_field: form_field )
        end 
    end  


    def new 
        if user_signed_in? 
        @form  = Form.new 
        else 
        redirect_to root_path ,  notice: 'You have to sign in to create a form'
        end 
    end  

    def create  
        if @form.save  
        redirect_to user_path 
        else  
        render :new  
        end 
    end  


    def destroy 
        if user_signed_in? && @form.user_id == current_user.id
        @form.destroy 
        redirect_to root_path ,  notice: 'Form was successfully deleted.' 
        else 
        redirect_to root_path , notice: 'Unauthorised access' 
        end 
    end 

    def edit
        if user_signed_in? && @form.user_id == current_user.id  
         @form
        else 
        redirect_to root_path , notice: 'Unauthorised access' 
        end 
    end 

    def update  
        if @form.save 
            redirect_to root_path , notice: 'Form was edited successfully.'
        else 
            render :edit 
        end 
    end 


=begin            
    private 
    def set_form 
        @form = Form.find(params[:id]) 
    end 
=end 

end   
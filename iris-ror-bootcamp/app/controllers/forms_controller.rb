class FormsController < ApplicationController 

    before_action :set_form ,  only: [:show ,   :new_response]  

    def show  
        @form_details = @form  
        @form_fields = FormField.where(form_id: @form.id)     
    end 

    def index 
        @forms = Form.all  
    end    

    def new_response  
        @response = @form.responses.build  

        @form_fields = FormField.where(form_id: @form.id )  
        
        

        @form_fields.each do |form_field| 
            @response.answers.build(form_field: form_field    )
        end 
    end 
            
    private 
    def set_form 
        @form = Form.find(params[:id]) 
    end 

end   
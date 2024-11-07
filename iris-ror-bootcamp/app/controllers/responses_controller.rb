class ResponsesController < ApplicationController  

    load_and_authorize_resource 

    def create 
        @response = Response.new(response_params) 

        if @response.save 
            redirect_to  responses_path   
        else 
            flash[:notice] = "failed to save the response" 
            Rails.logger.debug(@response.errors.full_messages)  
            redirect_to  new_response_form_path(@response.form.id) ; 
        end 
    end 

    def index  
         #@responses = Response.all   
    end  

    private 
    def response_params 
        params.require(:response).permit(:form_id  ,answers_attributes: [ :form_field_id   ,    :response_text  ,  :response_radio_choice , response_checkbox_choices: [] ]   )  
    end 


end 
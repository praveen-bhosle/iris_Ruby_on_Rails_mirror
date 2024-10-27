# Controllers to take user response and save it to the database

Now that we have a basic index action, we would like to create some actions that lets the users interact with the forms

## 1. Action to let users answer to forms
  We have already created a few forms using the console. Now let us write some controllers to help us create responses to those. In `forms_controller.rb` -
  ```ruby
  class FormsController < ApplicationController
    before_action :set_form, only: [:new_response, :show, :edit, :update, :destroy]   # We update the before_action to include the new_response action 
    # A new action to create a blank response and then populate that response with empty form fields
    def new_response
      # Code to create a new Response object and connect it to the form instance found from set_form
      # Code to fill the response object with empty answers corresponding to the form_fields of the form object
    end

    def set_form
      # Same code as before
    end
  end
  ```

## 2. Action to submit create the response in the database
  Now that we have a controller which allows users to make new response objects, let us write a controller to save the response. In `responses_controller.rb`
  ```ruby
  class ResponsesController < ApplicationController
    def create
      # Create a response object and fill it with the parameters being sent in the HTTP request object
      @response = Reponse.new(response_params)
      # Code to check if the form is saved succesfully and redirect with a success message, or to redirect back to a new response page with an error message
    end
  
    def response_params
      params.require(:response).permit(:form_id, answers_attributes: [:form_field_id, :response_text])
    end
  end
  ```
_Note - Refer to [Action Controller](https://guides.rubyonrails.org/action_controller_overview.html) for more details_

## 3. Action to see all responses
  This is similar to what we did in the index action of `forms_controller.rb`. Figure it out on your own :)
  

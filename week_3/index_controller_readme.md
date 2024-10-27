# Index and Show Actions in a Controller

Controllers represent the backend logic of your application. We fetch data from the database using controllers. Last week, you created many models which sort of represent how data is stored in your database.
Now, we would like to be able to perform a few basic operations on that data. The most basic operations include - `index`, `show`, `edit`, `update`, and `destroy`

* The index operation usually lists out all the instances of a model
* The show operation shows all the details of a particular instance

So let's say we have a model called `Car`. The index operation will fetch and display all the instances of the `Car` model, but the show action will display the details of any one `Car` instance.

First, we will create an index action to show all the forms that have been created.

1. In your `app/controllers` folder, create a file named `forms_controller.rb`
   <br>
   
2. Write the following code to define your controller -
   <br>
   ```ruby
   class FormsController < ApplicationController
   end
   ```

  
3. Now, create the index action like so -
   <br>
   
   ```ruby
   class FormsController < ApplicationController
      def index
        # Code to fetch all instances of the Form model
      end
   end
   ```
5. Great! Now we have the index action ready, but how can we see it in action? We shall see!
   Before we get started, it is important to understand how a controller action can access the parameters being sent within the request. RoR does this using the `params` hash, which is
   basically a set of key-value pairs corresponding to the parameters that have been sent with the request.

   So in order to access let's say the `id` being sent in the request, we would call
   `f_id = params[:id]`
   <br>
   
   Let us work on the show action now. This action will be in the same `forms_controller.rb` file.
   ```ruby
   # Action that first finds the form we wish to see and then fetches the fields of that form
   def show
      # Code to find a form from the id being sent within the request
      # Code to fetch all the form_fields associated with a form
   end
   ```
   
  If you remember all the basic operations (index, show, create, edit, update, destroy), we need to fetch a particular instance of `Form` model (using id) in all of them, just like we have done in the code above.
  Instead of writing the same line again and again, we can use [Action Callbacks](https://guides.rubyonrails.org/action_controller_overview.html#action-callbacks) to simplify our work.

  The action callback we shall use here is `before_action`

  ```ruby
  class FormsController < ApplicationController
    # Only use this before_action for the listed actions. (Because index and other actions may not require it)
    before_action :set_form, only: [:show, :edit, :update, :destroy]
    # Other code

    def show
      # Code to fetch all the form_fields associated with a form
    end

   def before_action
      # Code to fetch a form using params[:id]
   end
  end
```

Now, everytime a request goes to the `show`, `edit`, `update` or destroy actions, it will first go through the before_action. In the before_action, you can store the `Form` instance in a variable, and use the same variable in the proceeding actions

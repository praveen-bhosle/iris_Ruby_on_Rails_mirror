# More Auth!!!

## Adding Authorization Rules

With `devise` and `cancancan` setup, we can now define authorization rules for our application.

1. We need to create a migration to update our forms table (You may want to delete everything in your database before
   running this migration).
    * Run the following command in the terminal:
        ```bash
        rails generate migration AddUserRefToForms 
        ```
    * Edit the migration file and add the following code inside the `change` method:
        ```ruby
        add_reference :forms, :user, null: false, foreign_key: true
        add_column :forms, :public, :boolean, default: false
        ```
    * Run the migration:
         ```bash
          rails db:migrate
      ```      
2. Open the `ability.rb` file located in the `app/models` directory.
    * Copy and replace the contents of the file with the following code:
    ```ruby
    class Ability
      include CanCan::Ability

      def initialize(user)
         # Here in the function, we are not sure if the user is logged in or not
         # Public Permissions can be defined here 
         can :read, Form, public: true
   
         return unless user.present?
         # At this point we know that the user is logged in
         # A logged in user perform any action on any form that they own
         can :manage, Form, user: user
   
         return unless user.superuser?
         # At this point we know that the user is a superuser
         # A superuser is allowed to do everything
         can :manage, :all
      end
    end
    ```
    * The `:manage` and `:all` symbols are special `cancancan` keywords that allow the user to perform any action on any
      model.
    * The gems `devise` and `cancancan` harmoniously work together. The `user` parameter is obtained from the
      `current_user` method provided by `devise`, while `cancancan` enforce the rules defined in the `Ability` class.
3. Adding authorization to controllers is easy, just add the following line to the top of the controller:
    ```ruby
    load_and_authorize_resource
    ```
    * This line will load the resource and authorize the user to perform the action on the resource.
    * For example, in the `forms_controller.rb` file, add the line at the top of the file:
    ```ruby
    class FormsController < ApplicationController
      load_and_authorize_resource
      ...
    end
    ```
    * As an exercise, add the line to all your controllers.
    * Along with authorization, this method also loads the resource for you. You can access the loaded resource using
      the `@resource` instance variable.
        * A peek behind the scenes of what this method does. It generates the definition of the `index` and `show`
          actions in the controller as follows:
      ```ruby
         def index
           @resources = Resource.accessible_by(current_ability)
         end
      
         def show
           @resource = Resource.find(params[:id])
           authorize! :show, @resource
         end
         ```
        * With these basic definitions, you can extend these actions to your heart's content.
4. Since we added new columns to our forms table, we need to update the `edit` and `create` options in the
   `forms_controller.rb` file.
    * Update the `create` method to add this line:
    ```ruby
    def create
      ...
      @form.user = current_user
      ...
    end
    ```
    * Update the `form_params` method to permit the `public` attribute. This is left as an exercise to you.
    * Update `views/forms/_form.html.erb` to include a checkbox for the `public` attribute. This is left as an exercise
      to you.
5. Finally, go back to the `ability.rb` file and implement rules for the following cases:
    * If a form is public, anyone can create a response to it.
    * If a form is not public, only signed-in users can create a response to it.
    * Only the owner of a form can view the responses to forms created by them.
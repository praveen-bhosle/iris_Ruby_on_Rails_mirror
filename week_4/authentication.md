# Authentication

## Introduction

Authentication is the process of verifying the identity of a user. It is a mechanism that allows users to prove their identity before accessing a particular resource or service. In web applications, authentication is essential to ensure that only authorized users can access the application.

In this module, you will learn how to implement authentication in a Ruby on Rails application using the Devise gem.

### Common Authentication Methods

There are several methods to authenticate users in web applications. Some of the common methods include:

1. **Basic Authentication**: This method involves sending the username and password in the request headers. It is simple to implement but not very secure as the credentials are sent in plain text.
2. **Token-Based Authentication**: In this method, a token is generated for each user, which is used to authenticate the user. The token is sent with each request to authenticate the user. This method is more secure than basic authentication.
3. **OAuth**: OAuth is an open standard for access delegation, commonly used for allowing users to grant third-party applications access to their resources without sharing their credentials. It is widely used by social media platforms and other web services.
4. **Session-Based Authentication**: In this method, a session is created for each user after successful authentication. The session ID is stored in a cookie, and the server uses this ID to identify the user for subsequent requests. This method is commonly used in web applications and this is what we will be implementing using Devise.

## What is Devise?

Devise is a flexible authentication solution for Rails applications. It provides a complete authentication system with features like user registration, login, logout, password reset, and more. Devise is highly customizable and allows you to configure authentication settings according to your application's requirements. You can read more about Devise [here](https://github.com/heartcombo/devise).

## Setting up Devise

Follow these steps to add devise to your Rails application:

1. Install the Devise gem:
   * Somewhere in your project, run this command in the terminal:
     ```bash
     bundle add devise
     ```
2. Next, you need to run the Devise generator:
   ```bash
   rails generate devise:install
   ```
   * This command prints out a lot of information to the terminal. The mandatory ones are indicated in the printed message. As an exercise, please implement all the mandatory steps.
3. Now, we need to create a Model to store users. Devise can generate the model for you:
   ```bash
   rails generate devise <ModelName>
   ```
   * We will call our model `User`:
     ```bash
     rails generate devise User superuser:boolean
     ```
   * This command will generate a `User` with default devise configuration. It will also add a column called `superuser` to `User` table, which will be used in a later step. Take a note of the generated migration file, as we will be editing it later.
4. The default options are good enough for basic applications. We will be adding the `:timeoutable` option for increased security. This option will automatically log out the user after a certain period of inactivity.
    * Open the `app/models/user.rb` file and modify the `devise` line to include the `:timeoutable` option. It should look like this:
    ```ruby
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
    ```
    *  Modify the `config/initializers/devise.rb` file to set the timeout period. This will time out a user and ask for their password after 30 days of inactivity. Add the following line:
    ```ruby
    config.timeout_in = 30.days
    ```
   * A brief explanation of the other modules:
     * `:database_authenticatable` - Handles user authentication using a database (Session Based Authentication).
     * `:registerable` - Allows users to register and manage their accounts.
     * `:recoverable` - Provides password reset functionality.
     * `:rememberable` - Enables "remember me" functionality.
     * `:validatable` - Adds validations for email and password.
5. Edit the migration file generated in step 3 and make the `superuser` column non-nullable and a default value of `false` to the `users` table:
   ```ruby
   t.boolean :superuser, null: false, default: false
   ```
6. Next, you need to run the migration to create the `users` table in the database:
   ```bash
   rails db:migrate
   ```
7. Voilà! You have successfully set up Devise. Take a look at the *shiny* login page at [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in).

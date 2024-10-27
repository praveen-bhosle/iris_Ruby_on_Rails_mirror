# Configuring routes for the Rails Application

Routes are an important part of an application, they define the endpoints to which your requests shall go. The routes can be configured in `config/routes.rb`
```ruby
Rails.applications.routes.draw do
  resources :forms, only [:index, :show] do
    member do
      get 'new_response'
      get 'responses'
    end
  end

  resources :responses, only [:create]
end
```

Now, what does all this mean?

Let's start with `resources`
In RoR, a 'resourceful' route provides a mapping between HTTP verbs and URLs and controller actions. By convention, each action also maps to particular operations (index, show, update, edit, destroy) in a database.
So, using something like - `resources :forms` generates different routes in your application corresponding to the various operations related to the `Form` model

Now, in the above code, we have nested resources too.
So, something like
```ruby
resources :photos do
  resources :comments
end
```
Ends up creating operation routes or URLs for the comments of a particular photo

So breaking down the code we have written -
```ruby
resources :forms, only [:index, :show] do
    member do
      get 'new_response'
      get 'responses'
    end
  end
```
Only for the index and show actions of the Form model, for every member (instance of a form) we generate new_response and responses URLs or routes.

Similarly, for responses, we only have the create URL defined. If you have an index to just show the responses separately, then you will have to configure the routes again. Try it out on your own!




# Views in Ruby

As you might have already learnt by now, every action in a controller in Rails can have a view associated with it. A view is simply an `html.erb` file that is rendered whenever your controller action is called. 
Think of it as what you will be showing to the users after fetching data in the controller

## Steps to create your own views in Rails
1. ### Create index view
   * Since we have an index action for fetching all forms, let's create an index view to finally show all that data to the user. In `app/views/forms` create a file named `index.html.erb` (Note how the action name and view name are the same)
  ```html
  <h1>Available Forms</h1>
  <ul>
    <% @forms.each do |form| %>
      <li>
        <h2><%= link_to form.name, form_path(form) %></h2>
        <p><%= form.description %></p>
      </li>
    <% end %>
  </ul>
  ```
2. ### Create show view
  * Similarly, we should also have a view for the show action which will show us all the details of a specific form. Figure this out.

3. ### Create response view
  * Now we need a view for actually rendering a form for the user to fill out. In `app/views/forms` create a `new_response.html.erb`
```html
<%= form_with(model: @response, url: responses_path, local: true) do |f| %>
  <%= f.hidden_field :form_id, value: @form.id %>

  <% @response.answers.each_with_index do |answer, index| %>
    <div class="field">
      <label><%= answer.form_field.field_text %></label>
      
      <% if answer.form_field.field_type == 0 %>
        <%= f.fields_for :answers, answer do |a| %>
          <%= a.text_field :response_text %>
          <%= a.hidden_field :form_field_id, value: answer.form_field.id %>
        <% end %>
      <% else %>
        <%= f.fields_for :answers, answer do |a| %>
          <%= a.number_field :response_text %>
          <%= a.hidden_field :form_field_id, value: answer.form_field.id %>
        <% end %>
      <% end %>
    </div>
  <% end %>

  <%= f.submit "Submit" %>
<% end %>
```

4. ### Create a response index view
  * Now that we are allowing users to respond to forms, we should be able to see these responses. For that, you can build an index view for the index action of response controller. Figure this one out.
  

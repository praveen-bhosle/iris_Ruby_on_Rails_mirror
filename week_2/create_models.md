# Creating Models in Ruby on Rails

The "M" in the **MVC** (Model-View-Controller) architecture stands for Models. Models are the part of the application that interact with the database, representing and managing the data. In Ruby on Rails, models handle data validation, relationships between tables, and business logic. They serve as a bridge between the database and the rest of the application, ensuring that data is properly stored, retrieved, and manipulated.

- [Watch this video to understand how models work in RoR](https://youtu.be/vbNWjisZn5s?si=5kWiy-ANuN_gCBzH) - **IMPORTANT**
- [Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html) - **IMPORTANT**
- [Active Record Query Interface](https://guides.rubyonrails.org/active_record_querying.html)

### We will follow [this database schema](./database_schema.md) to build the models in Ruby on Rails for this week.

## 1. Creating Models in the Rails Application - 20 points

By now, you should have already created a Rails application. Open the project in VS Code or GitHub Codespaces. Ensure that you are in the project directory (e.g., `iris-ror-bootcamp` if you named your project that way).

### 1. Create the `Form` Model

```
rails generate model Form name:string description:text
```

### 2. Create the `FormField` Model

```
rails generate model FormField form:references field_text:text field_type:integer
```

> **Note**: `form:references` will automatically create a `form_id` column and set up the **foreign key** relationship with the `Form` model.

### 3. Create the `Response` Model

```
rails generate model Response form:references
```

### 4. Create the `Answer` Model

```
rails generate model Answer response:references form_field:references response_text:string
```

--- 

## 2. Interacting with Models in the Rails Console - 20 points
Once you've created your models, you can interact with them through the Rails console. First, enter the Rails console with the following command:

```
rails console
```

Here are some useful queries to get started:

### 1. Creating a Form

```
Form.create(name: "IRIS Bootcamp Feedback Form", description: "This is the description")
```

### 2. Creating a Field for a Form

```
FormField.create(form_id: 2, field_text: "How was the bootcamp", field_type: 1)
```
Alternatively, you can define a has_many relationship in your form.rb model to create fields directly from the form object:
`form.rb` should look like this

![image](https://github.com/user-attachments/assets/c3d5e637-3a81-4087-99dd-a71d4f434759)
Now you can create a field for a form using the form object:

```
form = Form.find_by(id: 1)
form.form_fields.create(field_text: "Rate the bootcamp out of 10", field_type: 2)
```

### 3. Updating the Name of a Form

```
Form.find_by(id: 1).update(name: "IRIS Web Bootcamp Feedback Form")
```

### 4. Deleting a Form

```
Form.find_by(id: 1).destroy
```

- [You can refer to this article to learn more model queries in RoR](https://guides.rubyonrails.org/active_record_querying.html)

  
**NOTE: Attach the screenshots of the queries you ran in the Readme file which you would create for submitting the assignment for week 2.**

---

## 3. Update the models and schema - 30 points

By now, you should have created the basic models as instructed. It’s time to challenge your understanding of models and schema.

- In forms like Google Forms or IRIS, you’ll notice that some questions allow for multiple options (e.g., checkboxes or radio buttons). Modify the models you’ve created to store the options as well. You will need to adjust the database schema accordingly.

- Additionally, forms are often divided into sections, with each section containing a set of fields. Update your models to accommodate multiple sections in a form.

- Implement some scopes in `app/models/form.rb` - [Scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes)


---

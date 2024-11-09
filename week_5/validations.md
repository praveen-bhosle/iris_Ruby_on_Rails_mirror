# Validations

## Introduction

Validations are a crucial part of any application. They ensure that the data entered by the user is correct and meets
the requirements set by the application. In Ruby on Rails, validations are used to ensure that the data saved to the
database is valid and consistent.

## Types of Validations

Rails provides a wide range of validation helpers that you can use to validate the data in your models. Some of the most
commonly used validation helpers are:

1. `presence`: Ensures that the specified attribute is not empty.
2. `length`: Validates the length of the attribute's value.
3. `uniqueness`: Ensures that the attribute's value is unique in the database.
4. `format`: Validates the format of the attribute's value using a regular expression.

There are many more useful validation helpers available in Rails. You can find a complete list of validation
helpers [here](https://guides.rubyonrails.org/active_record_validations.html).

## Steps

1. Let's start with a simple validation, the name of the form should not be empty, and its length should be between 5
   and
   50 characters.
    * Add the following line to you `Form` model:
   ```ruby
    validates :name, presence: true, length: { in: 5..50 }
    ```
2. Next, let's add a validation to ensure that the email entered by the user is in the correct format.
    * Add the
      following line to your `User` model:
    ```ruby
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
   ```
    * `URI::MailTo::EMAIL_REGEXP` is a regular expression that matches the format of an email address.
3. Now, let's add a validation to ensure that the response to a form field is not empty.
4. Next implement some custom validators:
    * Since our form field can be of different types, we need to validate the response based on the type of the form
      field. For example, if the form field is of type `number`, the response should be a valid number.
    * To use a custom method as a validator, you can define a method in your model and use the `validate` method to
      call it.
    * Add the following method to your `FormResponse` model:
    ```ruby
    validate :validate_response
   
    def validate_response
      case form_field.field_type
      when 'number'
        errors.add(:response, 'should be a number') unless response.to_i.to_s == response
      when 'email'
        errors.add(:response, 'should be a valid email') unless response.match?(URI::MailTo::EMAIL_REGEXP)
      end
    end
    ```
    * This method covers only two types of form fields, you can extend it to cover other types that you have implemented.
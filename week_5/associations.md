# Associations

## Introduction

Associations allow you to define relationships between models. We have already used some basic associations in our
project, such as `has_many`, `belongs_to`, and `has_one`. This task is very simple, you need to identify the
existing associations in your project.

## Types of relationships

In a relational database, there are three main types of relationships:

1. **One-to-One**: A single record in the first table is related to a single record in the second table.
    * Example: Let's say we have two tables, `users` and `user_preferences`. Each row in the `users` table is related to
      a single row in the `user_preferences` table and vice versa.
2. **One-to-Many**: A single record in the first table is related to multiple records in the second table.
    * Example: Let's say we have two tables, `users` and `posts`. Each row in the `users` table can be related to
      multiple rows
      in the `posts` table, but each row in the `posts` table can be related to only one row in the `users` table.
3. **Many-to-Many**: Multiple records in the first table are related to multiple records in the second table. They are
   typically implemented with an intermediate join table, that is used to link two records.
    * Example: A `Student` has many `Courses` and a `Course` has many `Students`.

Rails Associations are a way to describe these relationships between models.

## Associations in Rails

Now, we will learn how to model the above relationships in Rails using ActiveRecord associations.

1. **One-to-One**: Use the `has_one` and `belongs_to` associations.
2. **One-to-Many**: Use the `has_many` and `belongs_to` associations.
3. **Many-to-Many**: Use the `has_many :through` association. This requires an intermediate join model. If you only need
   a simple many-to-many relationship without any additional fields, you can use the `has_and_belongs_to_many`
   association.

## Steps

1. Realize the associations already present in the project.
    * Review the existing models in your project and identify the associations between them.
    * If it doesn't exist already, create a `README.md` file in the root directory of your project and list out some
      associations.
        * For example, we had used a one-to-many association between `Form` and `FormField` models. You can write
          something like this:
        ```markdown
        # Associations
      
        * A `Form` has many `FormFields`.
        * A `FormField` belongs to a `Form`.
        * ...
        ```
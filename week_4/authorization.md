# Authorization

## Introduction

Authorization is the process of determining whether a user has the necessary permissions to access a particular resource
or perform a specific action. It is a mechanism that allows you to control access to different parts of your application
based on the roles and permissions assigned to users.

## What is CanCanCan?

CanCanCan is an authorization library for Ruby on Rails that provides a simple way to define and manage user
permissions. It allows you to define abilities for different user roles and restrict access to certain parts of your
application based on these abilities. CanCanCan is highly customizable and provides a clean and readable way to handle
authorization logic in your Rails application.

## Setting up CanCanCan

Follow these steps to add CanCanCan to your Rails application:

1. Install the `CanCanCan` gem:
    * Run this command in your terminal:
      ```bash
      bundle add cancancan
      ```
2. `CanCanCan` enforces authorization rules through an `Ability` class. You need to generate this class:
   ```bash
   rails generate cancan:ability
   ```
    * This command will create an `ability.rb` file in the `app/models` directory. This file is where you define the
      abilities for different user roles.
3. That's it! `CanCanCan` is now setup. In the next assignment we will be modifying the `ability.rb` file to define the
   authorization rules for your application.

# Week 4: Authentication and Authorization in Ruby on Rails

In Week 4, you will understand concepts of authentication and authorization. You will learn how to implement these
concepts in Ruby on Rails by extending your *form management* application.

## Topics Covered

* [Authentication](https://auth0.com/docs/get-started/identity-fundamentals/authentication-and-authorization)
* [Authorization](https://auth0.com/docs/get-started/identity-fundamentals/authentication-and-authorization)
* [Devise Gem](https://github.com/heartcombo/devise)
* [CanCanCan Gem](https://github.com/CanCanCommunity/cancancan)

## Video Resources

* [Authentication Deep Dive](https://youtu.be/3rZK-ABAwg0?si=i39VC1uQk3V3bjAG)

## Additional Resources

* [Devise Wiki](https://github.com/heartcombo/devise/wiki)
* [OWASP Top 10](https://owasp.org/www-project-top-ten/): **OWASP** is a great resource for understanding security vulnerabilities in web applications. 

# Assignment

This week you will work on the same Ruby on Rails project from last week. You will extend the project by adding
authentication and authorization to it. On the way you will learn about Authentication, Authorization, the difference
between the two, and how to implement them in Ruby on Rails.

### Steps for this week

* Setup Devise - [Steps](./authentication.md)
    * Learn what is authentication and implement it in you application with the help of the Devise gem.
* Setup CanCanCan - [Steps](./authorization.md)
    * Learn what is authorization and implement it in you application with the help of the CanCanCan gem.
* Add authorization to your forms - [Steps](./authorization-2.md)
  * Forms can be public or private. Forms can be created by logged-in users only. Only the creator of a form can edit or delete it. Responses to a form can be viewed only by the creator of the form. Public forms can be viewed by anyone. Private forms can be viewed only by signed-in users.
* BONUS: Style the auth pages and make it look amazing.

## Submission Guidelines

Refer to [this](../submission-instructions.md) for details on how to submit your assignment.
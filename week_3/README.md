# Week 3: Introduction to Controllers in Ruby on Rails (RoR)

In Week 3, you will understand how the MVC architecture works and will be creating controllers for your application. You will continue working on the simple *form management system* from last time and will be writing controllers for the same.

## Topics Covered
* [Understanding MVC Architecture](https://dev.to/dumebii/model-view-controller-in-rails-a-deep-dive-into-the-mvc-architecture-4oi1#the-pillars-of-the-mvc-architecture-model-view-controller)
* [How to write Controllers in Ruby on Rails](https://learn.codesignal.com/preview/lessons/3362/controllers-in-rails)
* [Routing in Rails](https://guides.rubyonrails.org/routing.html)
* [Basic embedded Ruby in HTML](https://medium.com/startup-rocket/a-quick-introduction-to-embedded-ruby-a-k-a-erb-eruby-7b6d26bf939d)

## Video Resources
* [Controllers in Ruby on Rails](https://youtu.be/OpYUczUiHbI?si=xLgPLFN4CgvkZfoX)
* [Views in Ruby on Rails](https://youtu.be/q3JEVQek_4E?si=g4I7jc_f-8-wzXYi)

## Additional Resources
* [Hashes](https://www.geeksforgeeks.org/ruby-hashes-basics/) (Try and think where we could use these)
* [Action Controller Overview](https://guides.rubyonrails.org/action_controller_overview.html)

<br/>

# Week 3 Assignment
Your task this week is to work on the basic application you created last week. Now that you have the models ready, you will need some controllers to allow users to interact with the forms and then save the forms to the database (Handle user input using **controller** logic and save it to **model** instances in the database

### Steps for this week

1. **Create an index and show controller** _- 20 points_ - [Follow this](./index_controller_readme.md)
   * Realize how controllers work and create an index action which fetches and displays all the user made forms. Also create a show action which shows the details of a particular form
2. **Create a controller to allow users to respond to forms** _- 40 points_ - [Follow this](./response_controller_readme.md)
   * The controller should allow users to respond to any form displayed in the index view
3. **Configure routes** _- 20 points_ - [Follow this](./routes_readme.md)
   * The controllers will handle the logic but you also need to handle the url routes for the actions in a controller. For that, we need to make some changes in our config
4. **Create basic HTML pages for the views** _- 20 points_ - [Follow this](./views_readme.md)
   * These pages will finally give your project a frontend with which the user can interact
5. **BONUS** - **Style the views using any CSS framework**
   * You can use any frameworks you are comfortable with (even plain CSS is fine!) Just make sure it looks good :)


## Submission Guidelines
Same as last week

# Associations—Continued

## Introduction

You will now implement a few associations on your own. In this task, we will be allowing the form owner to invite other
users to view the form responses. Further, the form owner can also invite users to edit the form.

### Steps

The form owner can invite users to view or edit the form.

* A `viewer` can only view the form and its responses.
* An `editor` can view form responses and edit the form.
* To invite a user, the owner needs to enter the email address of the user. If the user exists, email the
  user with the invitation link. If the user does not exist, create a new user with the email address and send an
  email with the invitation link.

1. Create a `FormInvite` model. This model will store the form ID, user ID, the role of the user (viewer or editor) and
   whether the user has accepted the invitation.
    * The `FormInvite` model should have the following columns:
        * `form_id` (integer)
        * `user_id` (integer)
        * `role` (enum) - Can be either `viewer` or `editor`
        * `accepted` (boolean)
2. Create the necessary associations between the `Form`, `User`, and `FormInvite` models.
3. Implement the controller actions to invite users to view or edit the form. Ensure that:
    * Only the invited user is able to accept the invite.
    * Only the form owner can invite users to view or edit the form.
4. As for the views, implement the following:
    * A button to invite users to view or edit the form. When the button is clicked, a modal
      should pop up asking for the email address of the user to invite. Once the invitation is created, show the link
      which
      can be shared with the invitee to accept the invitation.
    * A page/modal that shows the list of users who have been invited to view or edit the form. The form owner should be
      able to revoke the invitation or change the role of the user.
5. Update the `models/ability.rb` file to allow access to the form based on the role of the user.
6. (Optional) When an invitation is created, email the user with the invitation link.
    * Though we haven't covered sending emails so far, you can do this with `ActionMailer` in Rails. Read the
      [Action Mailer Basics](https://guides.rubyonrails.org/action_mailer_basics.html) guide to get started and as a
      challenge, implement this feature.

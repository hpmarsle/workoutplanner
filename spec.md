# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database (created tables in my db for my objects through AR Migrations)
- [x] Include more than one model class (User and Exercise)
- [x] Include at least one has_many relationship on your User model (User has_many Exercises)
- [x] Include at least one belongs_to relationship on another model (Exercise belongs_to User)
- [x] Include user accounts with unique login attribute (username) 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (in Exercise Controller routes)
- [x] Ensure that users can't modify content created by other users (@exercise = Exercise.find_by_id(params[:id])if logged_in? && current_user.exercises.include?(@exercise)
- [x] Include user input validations (validates the user enters a name, email, password, username in the forms and that username is unique for signup)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
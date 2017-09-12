# GA-Project4-BackEnd
## Project #4: Ruby on Rails - Group Project
## Epic Create a Back End application for handeling GA Gizmo Alumni Blogs 

## User Stories
1. As a user I want to submit a blog entry.
2. As a user I want to edit my blog submissions.
3. As a user I want to filter/sort/view blog entries with interactive criteria.
4. As an Admistration I want to manage the alumni list (blog members that can submit).
5. As a developer I need to setup GIT repository for GA-Project4-FrontEnd.
6. As a developer I want to have my Frontend setup as an Angular Project.
7. As a developer I need to add all blog table CRUD limiting routes with the routes.rb file.
8. As a user I don't want anyone to be able to edit nor delete my blong entries.  Only myself as the owner can do this.
9. As a user I don't want anyone but me to be able to see my User account/data.

 
## Work Items
1. As a user I want to submit a blog entry.
* PUT Rails Controller into postgresql blog table
2. As a user I want to edit my blog submissions.
* UPDATE Rails Controller method for updating blog table blog entires.
3. As a user I want to filter/sort blog entries with interactive criteria.
* GET blog list with filtering done on the front end
4. As an Admistrator I want to manage the alumni list (blog members that can submit).
* Use JWT (tokens) for enabeling sessions.
5. As a developer I need to setup GIT repository for GA-Project4-BackEnd.
* Create and add collaborators to GIT for this project.
6. As a developer I want to have my Backend setup with Rails.
* Use the Rails dev model for creating the the backend application.
7. As a developer I need to add all blog table CRUD limiting routes with the routes.rb file.
* Routes.rb file will define resources to limit access to only what is desired/required.
8. As a user I don't want anyone to be able to edit nor delete my blong entries.  Only myself as the owner can do this.
* Linking of the Blog table (many) to the User (one) table via the user user-id for each blog entry will enable the backend to check the user-id for UD (of CRUD) operations.  JWT will be used to leverage this functionality.
9. As a user I don't want anyone but me to be able to see my User account/data.
* JWT will be used to enable this functionality.


## Git Repository
https://github.com/lin1ood/GA-Project4-BackEnd

## Heroku Deployment
https://gizmo-blogger-backend.herokuapp.com/

## Streach Goals
1. White list by know emails user registraiton.  It is open now to all.
2. Dynamically support URL strings for both local and Heroku Deployments


Web App Name: RecipeList

Author: vm00308

Idea:
A site that allows users to sign in so that they can enter recipes for other users to read. Only users who created a recipe can edit or delete that recipe. An admin user (which is set via the rails console [heroku run rails console, User.find(user_id).toggle!(:admin)]) can delete any user (and thus all their recipes), any category and any recipe. Users need to sign up and also be logged in before they can create an recipe. Categories can also be linked to an recipe so that it is easier for users to find certain recipes - however, this is not a requirement.

Ruby Version: ruby 2.6.4p104 (2019-08-28 revision 67798) [x64-mingw32]
Rails Version: Rails 6.0.1 
 
Reason for using this version of Ruby on Rails - I attempted using different version of Rails on another system, even doing a clean reset of Windows 10 because none of the versions were working. Initially, when creating an application, I had issues with the sqlite3 gem. After using different versions of Ruby and Rails, I got errors in regards to the bootsnap gem. All of my troubleshooting did not work, therefore I had to use the only version of RoR that worked. 

Git Version: git version 2.22.0.windows.1

Heroku Version: heroku/7.35.0 win32-x64 node-v12.13.0

HerokuApp Link: https://vm00308-com2025-project.herokuapp.com


References/Resources:
Welcome page images:
- https://assets.bonappetit.com/photos/57d317f8cba257a52320dac2/master/w_1200,c_limit/gjusta-main.jpg

Bootstrap navbar code (edited by vm00308):
Found on - https://getbootstrap.com/docs/4.0/components/navbar/

VALID_EMAIL_REGEX: https://www.natashatherobot.com/ruby-email-validation-regex/
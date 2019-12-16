Web App Name: RecipeList

Author: vm00308

Idea:
A site that allows users to sign in so that they can enter recipes for other users to read. Only users who created a recipe can edit or delete that recipe. An admin user (which is set via the rails console [heroku run rails console, User.find(user_id).toggle!(:admin)]) can delete any user (and thus all their recipes), any category and any recipe. Users need to sign up and also be logged in before they can create an recipe. Categories can also be linked to an recipe so that it is easier for users to find certain recipes - however, this is not a requirement.

Ruby Version: ruby 2.6.4p104 (2019-08-28 revision 67798) [x64-mingw32]
Rails Version: Rails 6.0.1 
 
Reason for using this version of Ruby on Rails - I attempted using different version of Rails on another system, even doing a clean reset of Windows 10 because none of the versions were working. Initially, when creating an application, I had issues with the sqlite3 gem. After using different versions of Ruby and Rails, I got errors in regards to the bootsnap gem. All of my troubleshooting did not work, therefore I had to use the only version of RoR that worked.

Regarding jQuery - After trying multiple methods both shown in the labs/lectures and online troubleshooting, I have been unable to successfully implement jQuery without breaking most of my other features. I am not sure if it is due to the version of Ruby and or Rails that I am using but nothing solved the issue. I even tried the client_side_validations gem but it only showed error messages after submitting the request, which defeats the point of client side validation.

Regarding the tests - I have followed the same testing ways as in the slides but some of the tests do not work for some reason. I have not been able to successfully troubleshoot it. One of the errors I encountered was the SQLite3::BusyException: database is locked, for which no online solutions worked. If you run rails test, let it finish and then run rails test again without adding any code, sometimes the errors and or failures number changes - I have no idea why.

Git Version: git version 2.22.0.windows.1

Heroku Version: heroku/7.35.0 win32-x64 node-v12.13.0

HerokuApp Link: https://vm00308-com2025-project.herokuapp.com

NOTE: There is a 500 Internal Server Error when using the contact form on the heroku link - This is might be due to Heroku using a different mail system than SMTP or it might be a timeout error. If you check heroku logs however, it seems that it goes through.


References/Resources:
Welcome page images:
- https://assets.bonappetit.com/photos/57d317f8cba257a52320dac2/master/w_1200,c_limit/gjusta-main.jpg

Bootstrap navbar code (edited by vm00308):
Found on - https://getbootstrap.com/docs/4.0/components/navbar/

VALID_EMAIL_REGEX: https://www.natashatherobot.com/ruby-email-validation-regex/
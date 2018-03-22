# README

## TODO
See [board](https://github.com/jonwho/todo_rails/projects/1).

## Install
* Get dependencies `bundle install`
* Create database `rails db:create`
* Run migrations `rails db:migrate`

## ENV vars
Using Google OAuth 2.0 for registration + signin. This redirects the user to sign in through
their Google account and upon successful login redirects the user to our site and gives us a
token with permissions to request a limited amount of information from the user.
See [Google OAuth docs](https://developers.google.com/identity/protocols/OAuth2) for more.
See `config/initializers/omniauth.rb` for which environment variables are needed.

## Google OAuth
You must sign into your developer dashboard and request credentials to use the OAuth service.
Along with creating your credentials for OAuth you need to set your redirect URIs properly.
The redirect URIs this project uses is:

```
http://localhost:3000/auth/google_oauth2/callback
http://jonwho-todo.herokuapp/auth/google_oauth2/callback
https://jonwho-todo.herokuapp/auth/google_oauth2/callback
```

These redirect URIs need to be in the Google Developer Console under Credentials tab.

A common issue you might run into is not having set up the Google API correctly. Make sure to
enable the following APIs "Contacts API" and "Google+ API" in your developer console.
The issue [here](https://github.com/zquestz/omniauth-google-oauth2/issues/111) is helpful to
follow.

## Development
* Start server `rails s`

## Deployment
Hosted on Heroku. Get Heroku remote and push to master when ready. Steps should be...

### Remote setup for git
```
# This will create a new herokuapp with the name you passed.
heroku create <app_name>
```

```
# This will add a git remote named heroku from your app if it already exists.
heroku git:remote -a <heroku_app_name>
```

### ENV vars setup
```
# These variables needed to work OAuth.
heroku config:set GOOGLE_OAUTH2_CLIENTID=xxxxxxxxxxxx
heroku config:set GOOGLE_OAUTH2_SECRET=yyyyyyyyyyyyyy
```

```
# Pushes code to Heroku for it to build.
git push heroku master
# If migrations are pending run this to migrate.
heroku run rails --trace db:migrate
# If schema was changed from migrations will need to restart to refresh schema.
heroku restart
```

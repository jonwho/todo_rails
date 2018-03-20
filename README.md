# README

## TODO
See [board](https://github.com/jonwho/todo_rails/projects/1).

## Install
* Get dependencies `bundle install`
* Create database `rails db:create`
* Run migrations `rails db:migrate`

## Development
* Start server `rails s`

## Deployment
Hosted on Heroku. Get Heroku remote and push to master when ready. Steps should be...

```
heroku git:remote -a <heroku_app_name> (if need to pull in Heroku remote)
git push heroku master
heroku run rails --trace db:migrate (if any pending migrations)
heroku restart (to reload schema if ran migrations)
```

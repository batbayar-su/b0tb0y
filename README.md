## Heroku guide
https://devcenter.heroku.com/articles/getting-started-with-ruby

### setting environment variables
```
$ heroku config:set TIMES=10 
```
then use it on code with `ENV['TIMES']`

### heroku push code and opens it
```
$ git push heroku master
$ heroku open
```
### heroku tail log
```
$ heroku logs --tail
```
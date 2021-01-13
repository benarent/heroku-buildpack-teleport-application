# heroku-buildpack-teleport
Buildpack for connecting Teleport to Heroku Dyno and Applications


You can run the buildpack like this.

```
heroku create -b https://github.com/benarent/heroku-buildpack-teleport.git
# or if your app is already created
heroku config:add --index 1 BUILDPACK_URL=https://github.com/benarent/heroku-buildpack-teleport.git
git push heroku master
```

heroku buildpacks:add --index 1 BUILDPACK_URL=https://github.com/benarent/heroku-buildpack-teleport.git


if [ -z "$T_API_KEY" ]; then
  echo "T_API_KEY Teleport environment variable not set. Run: heroku config:add T_API_KEY=<your API key>"
  DISABLE_TELEPORT_SERVICE=1
fi
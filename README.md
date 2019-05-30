# Login with Github

Application was developed on Ruby on Rails. To start create a [Github OAuth App](https://github.com/settings/applications/new)
Follow the next steps after clonning this repo:

  - Run `bundle install` on the terminal to install dependencies
  - Insert Client ID and Client Secret into `.env` file
  - Run `rails s` to start the application

# .env config
.env file has to contain next vars

```
HOSTNAME=localhost
APP_URL=http://localhost:3000
GITHUB_LOGIN_URL=https://github.com/login/oauth/authorize?
GITHUB_CLIENT_ID=your_client_id
GITHUB_CLIENT_SECRET=your_client_secret
GITHUB_REDIRECT_URL=${APP_URL}/auth/github/cb
GITHUB_ACCESS_TOKEN_URL=https://github.com/login/oauth/access_token
GITHUB_USER_URL=https://api.github.com/user
```

# What was done
I have added next routes:
- `/` for displaying link to login with Github
- `/auth/github` redirects a user to request identity
- `/auth/github/cb` Github redirects back to this URL
- `/logout` to logout a user

I added `auth_controller` with following actions to handle routes.
- `index` shows a page with link to Github Auth
- `login` redirects to Github with needed params
- `cb` handles response from Github. It will request `access_token` from Github. Further, with `access_token` will be requesting user info that will be stored (if doesn't exist) on the database and session
- in the `logout` action will be removed user id from session, so will redirect to root url with flash message



# API Curious

This Rails app is a GitHub emulator using GitHub OAuth and their API. OAuth and user profiles are through Rails views, with additional data loaded through JavaScript fetch calls.

## Ruby version
This app uses:

* Ruby 2.4.2
* Rails 5.2

## Setup
After cloning this project, run

```
bundle install
rake db:create
rake db:migrate
```

### Setting up API keys
This app requires a GitHub API key using Rails 5.2 credentials. To add them to the Rails project, you must edit the encrypted file credentials.yml.enc which uses master.key to decrypt. To edit the credentials file in Atom, run

```EDITOR="atom --wait" rails credentials:edit```

or change appropriately depending on your text editor. In the credentials file enter the client_id, client_secret. The tests use a user token as well.
```
github:
  client_id: XXXXXXX
  client_secret: XXXXXXXXXXXXXXXXXXXXXX
  test_token:  XXXXXXXXXXXXXXXXXXXX
```

## Running the app
To run the app locally, run

```rails s```

Then visit localhost:3000 in your browser. This will allow you to sign up or login with GitHub.

## Testing
To run the test suite, run

```rspec```

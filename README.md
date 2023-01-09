% Punch Users

# TODO

- copy .punch/domain/README.md to Punch
- refresh Punch/README.md config section

# Overview

Punch User project serves as demo for applying [Punch](TODO) and describes my steps during punching.   


# Create project

```
$ punch new punch_users
$ cd punch_users
$ bundle install
$ punch domain
```

# Configure

See [punch domain README](.punch/domain/README.md) for possible options.

I decided to punch `.punch/domain/sample.rb` and want to have `Users` namespace, so I configured it as follows

```yml
lib: lib
test: test
sentries: users/sentries
entities: users/entities
services: users/services
plugins: users/plugins
```

# Generate

Then I modified `.punch/domain/dogen.rb`, requiring "sample" instead of "domain" and calling `build_sample_domain`, and got the following output

```
Punching Domain Skeleton..
- punching sentries..
- punching entities..
- punching services..
- punching plugins..
Success!
- lib/config.rb
- lib/domain.rb
- lib/users/entities/secret.rb
- lib/users/entities/user.rb
- lib/users/entities.rb
- lib/users/plugins/secrets.rb
- lib/users/plugins/storage.rb
- lib/users/plugins.rb
- lib/users/sentries.rb
- lib/users/services/admin_lock_user.rb
...
```

At the moment of Punch v0.6.0 punching domains have two issues not elaborated yet but fortunately they can be quickly fixed manually.

`lib/domain.rb` should be named as `lib/users.rb`, but Punch v0.6.0 does not have settings for domain name. It is just inclusion file like `lib/<gemname>.rb`.

`lib/config.rb` maybe should be placed under `users` folder, however, I haven't come to a final decision yet. Besides there is a bug, that should be fixed at the time you might read this text.

```ruby
require_relative "users/plugins"
include Users/plugins

StorageHolder = Storage.plugin
SecretsHolder = Secrets.plugin
```

# Status

It's interesting to get the first status by `$ punch status` and see how many files and SLOC was actually punched. I confess, there are a lot of comments in services tests..

```
Looking though 'lib', 'test' directories..

- 34 sources, 29 "punched" (28 remain "punched")
- 664 SLOC, 91 blank and 243 comment lines

'lib' summary:
- 17 sources, 13 "punched" (12 remain "punched")
- 329 SLOC, with 53 blank lines and 93 comments

remain "punched":
- lib/domain.rb
- lib/users/entities/secret.rb
..

'test' summary:
- 17 sources, 16 "punched" (16 remain "punched")
- 335 SLOC, with 38 blank lines and 150 comments

remain "punched":
- test/users/entities/test_secret.rb
..
```

# Git 1

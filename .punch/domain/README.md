% Punching Domains

> Having described your domain using Punch::DSL, you can quickly generate many more things than just Ruby code. It might fit perfectly for generating domain documentation, sketching future domain interfaces, etc.

Pay attention to punching settings in `punch.yml`. Set `lib` parameter to the folder to place generated code, `test` to place generated tests; using other parameters you point out the namespace.

If you configure as  `lib: lib/domain`, `test: test/domain`, and `service: services` your code will be placed into `lib/domain` and services will be placed in `lib/domain/services/` like `lib/domain/services/sing_up.rb`; the service namespace will be `Services`

If you configure as  `lib: lib`, `test: test`, and `service: users/services` your code will be placed into `lib` and services will be placed in `lib/users/services/`, like `lib/users/services/sing_up.rb`; the service namespace will be `Users::Services`

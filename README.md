% Punch Users

This is [Punch](https://github.com/nvoynov/punch) Demo for Punch::DSL.

All code in the repository was "punched" mainly by executing `.punch/domain/dogen.rb`, then some entities and tests were created manually.

The first `$ punch status` was as follows, although it might be different if you try to re-puch, because it was initially punched with Punch < 0.6.0. See full status in [status_1.txt](status_1.txt) 

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

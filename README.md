% Punch Users

> [A Little Architecture](https://blog.cleancoder.com/uncle-bob/2016/01/04/ALittleArchitecture.html)

Welcome to the [Punch](https://github.com/nvoynov/punch) Demo project!

1. Basic structure was "punched" by using `$ punch new punch_users` command.
2. Using [dogen.rb](.punch/domain/dogen.rb) script was "punched" `Users` domain (expressed by DSL in [sample.rb](.punch/domain/sample.rb)).
3. Basics sentry, entity, service, and plugin were ported from Punch using the `$ punch basics` command (it answers the question of where 6 new files come from.)
4. Then "punched" `Users` sources were changed manually to get work done and pass the tests.

Having finished steps 2 and 4, using `$punch status` command were preserved some statistics in [status_1.txt](status_1.txt) and [status_2.txt](status_2.txt)

It does not prove anything at the moment, let's say from the numbers below that for the `Users` domain

- 85% of source files were "punched" and 15% were created manually;
- 50% of Ruby LOC were "punched" and the other 50% were created manually.

```
Location   Total   "Punched" SLOC       Blank    Comments  Net Ruby LOC
---------- ------- --------- ---------- -------- --------- ------------
lib        23 (17) 13 (13)   657 (329)  102 (53) 175 (93)  380 (183)
test       17 (17) 15 (16)   363 (335)  46 (38)  45 (150)  272 (147)
lib + test 40 (34) 28 (29)   1020 (664) 148 (91) 220 (243) 652 (330)
```

Had ported Punch basics and structuring sources taken into account, these numbers could show a bit more efficiency.

Keep in touch, the project will be continued by creating HTTP/JSON service and then calculating the total LOC for the whole service code VS the domain code.

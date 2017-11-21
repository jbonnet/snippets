[![Build Status](https://travis-ci.org/jbonnet/snippets.svg?branch=master)](https://travis-ci.org/jbonnet/snippets)

# Snippets
> snippet |ˈsnɪpɪt| (noun): a small piece or brief extract -- _snippets of information about the war_.

For a number of years (say... 10?), I was a heavy user of [instiki](https://github.com/parasew/instiki) but it recently became, well, not the tool I wanted to work every day.

Therefore, I've started to work on this **snippets**...

# Features
I'm defining features as **user stories** (i.e., descriptions of how users interact with **Snippets**). These user stories are then implemented as a set of features.

## User stories
Check out the [wiki user stories](https://github.com/jbonnet/snippets/wiki/User-Stories) we intend to implement.

## Implemented features
Implemented features are the following:
1. [Stores snippets](https://github.com/jbonnet/snippets/wiki/stores-snippets);
1. [User adds a snippet](https://github.com/jbonnet/snippets/wiki/user-adds-a-snippet);
1. ...

# Usage

Run with:
```shell
$ RACK_ENV=development bundle exec rackup
```

Test with:
```shell
$ RACK_ENV=test bundle exec rake
```

# Maintainers
Any question, doubt, issue should be sent to **@jbonnet**.

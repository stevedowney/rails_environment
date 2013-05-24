# rails_environment

[![Build Status](https://travis-ci.org/stevedowney/rails_environment.png)](https://travis-ci.org/stevedowney/rails_environment)
[![Code Climate](https://codeclimate.com/github/stevedowney/rails_environment.png)](https://codeclimate.com/github/stevedowney/rails_environment)
[![Coverage Status](https://coveralls.io/repos/stevedowney/rails_environment/badge.png)](https://coveralls.io/r/stevedowney/rails_environment)

This class facilitates code like:
```ruby
if RailsEnvironment.production?
  # do stuff only in production environment
end
```

This prevent typos like:

```ruby
if Rails.env == 'productoin' ...
if Rails.env.productoin? ...
```
so we get a runtime error if we misspell an environment (v. a bug)

For standard Rails applications with `development`, `test` and `production` environments you get:

## Available methods

**Predicate method for each environment**

* `RailsEnvironment.development?`
* `RailsEnvironment.test?`
* `RailsEnvironment.production?`

**Negated predicate methods**

* `RailsEnvironment.not_development?`
* `RailsEnvironment.not_test?`
* `RailsEnvironment.not_production?`

**You can also "or" the environments, and negate the "or"'s**

* `RailsEnvironment.test_or_production?`
* `RailsEnvironment.not_test_or_production?`
* etc.

The methods available are based on the actual environments, i.e., `../config/environments/*.rb`


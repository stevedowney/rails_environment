# rails_environment

[![Gem Version](https://badge.fury.io/rb/rails_environment.png)](http://badge.fury.io/rb/rails_environment)
[![Build Status](https://travis-ci.org/stevedowney/rails_environment.png)](https://travis-ci.org/stevedowney/rails_environment)
[![Code Climate](https://codeclimate.com/github/stevedowney/rails_environment.png)](https://codeclimate.com/github/stevedowney/rails_environment)
[![Coverage Status](https://coveralls.io/repos/stevedowney/rails_environment/badge.png)](https://coveralls.io/r/stevedowney/rails_environment)

Error-free convenience methods for determining the running Rails environment.

This gem enables code like:

```ruby
if RailsEnvironment.production?
   <do_production_only_stuff>
end
```

This prevents typos like:

```ruby
if Rails.env == 'productoin' ...
if Rails.env.productoin? ...
```
So we get a runtime error if we misspell an environment instead of a silent bug.

## Available methods

For standard Rails applications with `development`, `test` and `production` environments you get:

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

**Short and Long environment names**

```ruby
RailsEnvironment.short  #=> 'DEV'
RailsEnvironment.long   #=> 'Development'

# customize the short/long names
RailsEnvironment.environment_strings['development']['short'] = 'DVL'
RailsEnvironment.short  #=> 'DVL'
```

## Notes

* The methods available are based on the actual environments, i.e., `../config/environments/*.rb`
* If you add/remove a file in `../config/environments` you will need to restart your server


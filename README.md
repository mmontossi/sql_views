[![Gem Version](https://badge.fury.io/rb/views.svg)](http://badge.fury.io/rb/views)
[![Code Climate](https://codeclimate.com/github/mmontossi/views/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/views)
[![Build Status](https://travis-ci.org/mmontossi/views.svg)](https://travis-ci.org/mmontossi/views)
[![Dependency Status](https://gemnasium.com/mmontossi/views.svg)](https://gemnasium.com/mmontossi/views)

# Views

Simple way to manage database views in rails.

## Why

I did this gem to:

- Avoid the need of migrations and versioning.
- Sync the views if any sql file changed with a task.

## Install

Put this line in your Gemfile:
```ruby
gem 'views'
```

Then bundle:
```
$ bundle
```

## Usage

Generate a view:
```
$ bundle exec rails g view guitars
```

Edit the generated sql file inside db/views:
```sql
SELECT
  products.*
WHERE
  products.category = 'Guitar'
```

Sync the views using the following rake task:
```
$ bundle exec rake db:views:sync
```

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

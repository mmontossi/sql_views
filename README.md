[![Gem Version](https://badge.fury.io/rb/views.svg)](http://badge.fury.io/rb/views)
[![Code Climate](https://codeclimate.com/github/mmontossi/views/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/views)
[![Build Status](https://travis-ci.org/mmontossi/views.svg)](https://travis-ci.org/mmontossi/views)
[![Dependency Status](https://gemnasium.com/mmontossi/views.svg)](https://gemnasium.com/mmontossi/views)

# Views

Simple way to manage database views in rails.

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
rails g view guitars
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
bundle exec rake db:views:sync
```

## Contributing

Because we've limited resources we'll mainly add features and keep a compatibility range close to what we need in our projects. However, contributions are more than welcome if someone wants to make any improvement.

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

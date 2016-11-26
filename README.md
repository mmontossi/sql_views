[![Gem Version](https://badge.fury.io/rb/views.svg)](http://badge.fury.io/rb/views)
[![Code Climate](https://codeclimate.com/github/mmontossi/views/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/views)
[![Build Status](https://travis-ci.org/mmontossi/views.svg)](https://travis-ci.org/mmontossi/views)
[![Dependency Status](https://gemnasium.com/mmontossi/views.svg)](https://gemnasium.com/mmontossi/views)

# Views

Simple way to manage database views in rails.

## Why

I did this gem to:

- Keep views definitions into separate sql files without versioning.
- Register views into schema.
- Control views from migrations.

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

To generate a view:
```
$ bundle exec rails g view guitars
```

Edit the generated sql file db/views/guitars.sql:
```sql
SELECT
  products.*
WHERE
  products.category = 'Guitar'
```

Run the migration:
```
$ bundle exec rake db:migrate
```

If you need to make a change, update the sql and run a migration with:
```ruby
class ChangeGuitarsView < ActiveRecord::Migration
  def change
    change_view :guitars
  end
end
```

If you want to drop it:
```ruby
class DropGuitarsView < ActiveRecord::Migration
  def change
    drop_view :guitars
  end
end
```

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

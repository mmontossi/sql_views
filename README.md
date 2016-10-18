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

## Configuration



In your config/routes.rb use the localized method to decide wich routes will be localized:
```ruby
localized strategy: :param, locales: %i(es en) do
  get 'page' => 'pages#show', as: :param
end

localized strategy: :subdomain, locales: { 'uy' => :es, 'us' => :en } do
  get 'page' => 'pages#show', as: :subdomain
end

localized strategy: :domain, locales: { 'domain.uy' => :es, 'domain.us' => :en } do
  get 'page' => 'pages#show', as: :domain
end
```

Put your localizations inside the routes key in your locales yamls:
```yaml
es:
  routes:
    page: "pagina"
```

NOTE: There is no need to put the full path, just localize each part individually.

## Usage

Helpers will continue working the same:
```ruby
param_path # Will output /en/pagina in case I18n.locale is :es for param strategy

subdomain_url # Will output http://uy.domain.com/pagina if current subdomain is uy

domain_url # Will output http://domain.uy/pagina if current domain is domain.uy
```

And you can change the locale by passing the corresponding parameter:
```ruby
param_path locale: :en # Will output /en/page

subdomain_url sudomain: 'us' # Will output http://us.domain.com/page

domain_url domain: 'domain.us' # Will output http://domain.us/page
```

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

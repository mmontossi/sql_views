$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'views/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'views'
  s.version     = Views::VERSION
  s.authors     = ['Mathías Montossi']
  s.email       = ['mmontossi@museways.com']
  s.homepage    = 'https://github.com/mmontossi/views'
  s.summary     = 'Database views for rails.'
  s.description = 'Simple way to manage database views in rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1'

  s.add_development_dependency 'pg', '~> 0.21'
  s.add_development_dependency 'mocha', '~> 1.2'
end

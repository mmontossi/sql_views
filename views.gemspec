$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'views/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'views'
  s.version     = Views::VERSION
  s.authors     = ['Mathías Montossi']
  s.email       = ['mmontossi@gmail.com']
  s.homepage    = 'https://github.com/mmontossi/views'
  s.summary     = 'Database views for rails.'
  s.description = 'Simple way to manage database views in rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'rails', ['>= 4.2.0', '< 4.3.0']

  s.add_development_dependency 'pg', '~> 0.18'
  s.add_development_dependency 'mocha', '~> 1.1'
end

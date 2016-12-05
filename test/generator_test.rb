require 'test_helper'
require 'rails/generators'
require 'generators/view/view_generator'

class GeneratorTest < Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'file generation' do
    self.class.tests Views::Generators::ViewGenerator
    run_generator %w(guitars)
    assert_file 'db/views/guitars.sql'
    assert_migration 'db/migrate/create_guitars_view.rb'
  end

end

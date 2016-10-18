require 'test_helper'
require 'rails/generators'
require 'generators/views/view_generator'

class GeneratorsTest < Rails::Generators::TestCase

  tests Views::Generators::ViewGenerator
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'file generation' do
    run_generator %w(guitars)
    assert_file 'db/views/guitars.sql'
  end

end

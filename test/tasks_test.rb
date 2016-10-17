require 'test_helper'

class TasksTest < ActiveSupport::TestCase

  setup do
    load File.expand_path('../../lib/tasks/sql_views.rake', __FILE__)
    Rake::Task.define_task :environment

    FileUtils.rm_rf Rails.root.join('tmp/digests/db/views')
    SqlViews.update
  end

  test 'update' do
    Product.create(name: 'Les Paul', category: 'Guitar')
    Product.create(name: 'Laney', category: 'Amps')

    result = ActiveRecord::Base.connection.execute('SELECT COUNT(*) FROM guitars')
    assert_equal 1, result.to_a.first['count'].to_i
  end

end

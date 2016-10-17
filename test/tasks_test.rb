require 'test_helper'

class TasksTest < ActiveSupport::TestCase

  setup do
    load File.expand_path('../../lib/tasks/sql_views.rake', __FILE__)
    Rake::Task.define_task :environment
  end

  teardown do
    FileUtils.rm_rf Rails.root.join('tmp/digests/db/views')
  end

  test 'update' do
    Product.create(name: 'Les Paul', category: 'Guitar')
    Product.create(name: 'Laney', category: 'Amps')

    Rake::Task['db:views:update'].invoke

    result = connection.execute('SELECT COUNT(*) FROM guitars')
    assert_equal 1, result.to_a.first['count'].to_i

    connection.expects(:execute).never
    Rake::Task['db:views:update'].invoke
  end

  private

  def connection
    ActiveRecord::Base.connection
  end

end

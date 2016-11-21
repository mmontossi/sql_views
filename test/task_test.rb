require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  setup do
    load File.expand_path('../../lib/tasks/views.rake', __FILE__)
    Rake::Task.define_task :environment
    FileUtils.rm_rf Rails.root.join('tmp/digests/db/views')
  end

  test 'sync' do
    Product.create(name: 'Les Paul', category: 'Guitar')
    Product.create(name: 'Laney', category: 'Amps')

    Rake::Task['db:views:sync'].invoke
    assert_equal 1, connection.execute('SELECT * FROM guitars').to_a.size

    connection.expects(:execute).never
    Rake::Task['db:views:sync'].invoke
  end

  private

  def connection
    ActiveRecord::Base.connection
  end

end

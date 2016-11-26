require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  setup do
    Dummy::Application.load_tasks
  end

  test 'load' do
    silence_stream(STDOUT) do
      Rake::Task['db:reset'].invoke
    end
    assert_equal 'guitars', ActiveRecord::Base.connection.views.first['name']
  end

  test 'dump' do
    path = Rails.root.join('db/schema.rb')
    FileUtils.rm_rf path
    silence_stream(STDOUT) do
      Rake::Task['db:schema:dump'].invoke
    end
    assert_includes File.read(path), 'create_view "guitars", force: true'
  end

end

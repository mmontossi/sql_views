namespace :db do
  namespace :views do
    task sync: :environment do
      Views.sync
    end
  end
end

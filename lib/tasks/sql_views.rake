namespace :db do
  namespace :views do
    task update: :environment do
      SqlViews.update
    end
  end
end

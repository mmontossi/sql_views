namespace :db do
  namespace :views do
    task update: :environment do
      Views.update
    end
  end
end

namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app cooler-communities --confirm cooler-communities
      heroku run rake db:migrate --app cooler-communities
      heroku run rake db:seed --app cooler-communities')	
  end
end

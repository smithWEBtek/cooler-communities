namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app cooler --confirm cooler
      heroku run rake db:migrate --app cooler
      heroku run rake db:seed --app cooler')	
  end
end

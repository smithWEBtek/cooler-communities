namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app mapc-cooler --confirm cooler
      heroku run rake db:migrate --app mapc-cooler
      heroku run rake db:seed --app mapc-cooler')	
  end
end

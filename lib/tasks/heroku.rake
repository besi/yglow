# TODO: Import the DB Dump from heroku
# See <https://github.com/yamldb/yaml_db/issues/63>


task :deploy do
  `git push heroku develop:master --force`
  `heroku run rake db:migrate`
  `heroku open`
  `git push origin develop:develop --force`
end


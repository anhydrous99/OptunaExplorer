namespace :db do
  desc 'Drops, create, migrates, and seeds the database'
  task :full_reset do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end

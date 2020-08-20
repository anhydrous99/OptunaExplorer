namespace :db do
  desc 'Drops, create, migrates, and seeds the database'
  task :full_reset do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end

  task :clean_tenants do
    Dir.glob('db/*.sqlite3') do |filename|
      next if filename.include? 'development.sqlite3' or filename.include? 'test.sqlite3'
      p 'Deleting ' + filename
      File.delete(filename) if File.exist? filename
    end
  end
end

require 'rake'
require 'rspec/core/rake_task'

require_relative 'config/application'

desc "create the database"
task "db:create" do
  puts "Creating file #{DB_PATH} if it doesn't exist..."
  touch DB_PATH
end

desc "drop the database"
task "db:drop" do
  puts "Deleting #{DB_PATH}..."
  rm_f DB_PATH
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end

# desc "Testing for control flow"
# task "test_control_flow" do
#   puts "should do nothing"
#   exec "ruby ./app/controllers/controller.rb add"
#   puts "should print added"
#   exec "ruby ./app/controllers/controller.rb add argument"
#   puts "should do nothing"
#   exec "ruby ./app/controllers/controller.rb remove"
#   puts "should print removed"
#   exec "ruby ./app/controllers/controller.rb remove argument"
#   puts "should print list"
#   exec "ruby ./app/controllers/controller.rb list"
#   puts "should do nothing"
#   exec "ruby ./app/controllers/controller.rb complete"
#   puts "should print completed"
#   exec "ruby ./app/controllers/controller.rb complete argument"
# end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs

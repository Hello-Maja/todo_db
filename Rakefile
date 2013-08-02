require 'rake'                  # => true
require 'rspec/core/rake_task'  # => true
# require_relative 'db/migrate/seeds'

require_relative 'config/application'  # => true

desc "create the database"                                # => "create the database"
task "db:create" do
  puts "Creating file #{DB_PATH} if it doesn't exist..."
  touch "./db/ar_todos.db"
end                                                       # => <Rake::Task db:create => []>

desc "drop the database"         # => "drop the database"
task "db:drop" do
  puts "Deleting #{DB_PATH}..."
  rm_f DB_PATH
end                              # => <Rake::Task db:drop => []>

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."                                                          # => "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end                                                                                                                                   # => <Rake::Task db:migrate => []>

desc "populate the test database with sample data"  # => "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end                                                 # => <Rake::Task db:seed => []>

desc 'Retrieves the current schema version number'                   # => "Retrieves the current schema version number"
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end                                                                  # => <Rake::Task db:version => []>

desc 'Start IRB with application environment loaded'  # => "Start IRB with application environment loaded"
task "console" do
  exec "irb -r./config/application"
end                                                   # => <Rake::Task console => []>

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

desc 'Seed the task list with awesome catch phrases'  # => "Seed the task list with awesome catch phrases"
task "db:seed" do
  require './db/seeds.rb'
  # Seed.generate_task_list
end                                                   # => <Rake::Task db:seed => []>


desc "Run the specs"              # => "Run the specs"
RSpec::Core::RakeTask.new(:spec)  # => #<RSpec::Core::RakeTask:0x007fe539e5ce70 @name=:spec, @rspec_opts=nil, @ruby_opts=nil, @rcov_opts=nil, @rcov=false, @warning=false, @fail_on_error=true, @verbose=true, @rcov_path="rcov", @rspec_path="rspec", @pattern="./spec{,/*/**}/*_spec.rb">

task :default  => :specs  # => <Rake::Task default => [specs]>

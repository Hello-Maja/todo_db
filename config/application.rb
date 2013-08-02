require 'pathname'       # => true
require 'sqlite3'        # => true
require 'active_record'  # => true
require 'logger'         # => false

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))  # => #<Pathname:/Users/apprentice/Desktop/ar_todos>

APP_NAME = APP_ROOT.basename.to_s  # => "ar_todos"

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s  # => "/Users/apprentice/Desktop/ar_todos/db/ar_todos.db"

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end                                               # => nil

# Automatically load every file in APP_ROOT/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')              # => "task"
  autoload ActiveSupport::Inflector.camelize(filename), model_file  # => nil
end                                                                 # => ["/Users/apprentice/Desktop/ar_todos/app/models/task.rb"]

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH     # => #<ActiveRecord::ConnectionAdapters::ConnectionPool:0x007f90ea5bc318 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Mutex:0x007f90ea5bc2c8>, @spec=#<ActiveRecord::ConnectionAdapters::ConnectionSpecification:0x007f90ea5b8448 @config={:adapter=>"sqlite3", :database=>"/Users/apprentice/Desktop/ar_todos/db/ar_todos.db"}, @adapter_method="sqlite3_connection">, @checkout_timeout=5, @dead_connection_timeout=5, @reaper=#<ActiveRecord::C...

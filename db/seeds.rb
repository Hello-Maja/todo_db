require 'Faker'
require_relative '../app/models/task'

# class Seed

#   def self.generate_task_list 

#   end

# end

10.times do
  Task.create! :description => Faker::Company.catch_phrase,
              :completed => false
end

require 'Faker'

class Seed

  def self.generate_task_list 
   10.times do
     Task.create :description => Faker::Company.catch_phrase
  end

end

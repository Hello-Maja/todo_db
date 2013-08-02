require 'Faker'

class Seed

  def move_to_db(description, status)
    Tasks.add(:description => 'description', :status => 'status')
  end
end

Seed.move_to_db("Ned", "False")

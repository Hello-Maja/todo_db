require_relative '../../config/application.rb'
require_relative '../models/task.rb'
require_relative '../views/viewer'

class Controller 
  IN_TEST = false

  attr_accessor :control_flow, :task

  def initialize
    if validated
      run!
    else
      Viewer.help
    end
  end

  def validated
    unless ARGV.empty?
      self.control_flow = ARGV.shift
      self.task = ARGV.join(" ").chomp unless ARGV.empty?
      return true 
    end
    false
  end

  def run!
    case control_flow
    when "add"
      puts "added" if IN_TEST && task
      Task.create!({description: task}) if task
    when "list"
      puts "listed" if IN_TEST
      Viewer.list(Task.all)
    when "remove"
      puts "removed" if IN_TEST && task
      if task
        t = Task.find(task.to_s) 
        t = t.destroy
        t.save
        puts t
      end
    when "complete"
      puts "completed" if IN_TEST && task
      if task
        t = Task.find(task.to_s) 
        t.completed = true if task
        t.save
      end
    else
      puts "help" if IN_TEST
      Viewer.help
    end
  end
end

Controller.new

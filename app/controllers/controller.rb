require_relative '../models/task.rb'
require_relative '../views/viewer'

class Controller 
  IN_TEST = true

  attr_accessor :control_flow, :task

  def initialize
    run! if validated
    Viewer.help
  end

  def validated
    unless ARGV.empty?
      self.control_flow = ARGV.shift
      self.task = ARGV.join.chomp unless ARGV.empty?
      return true 
    end
    false
  end

  def run!
    case control_flow
    when "add"
      puts "added" if IN_TEST && task
      Task.new({description: task}) if task
    when "list"
      puts "listed" if IN_TEST
      Viewer.list(Task.all)
    when "remove"
      puts "removed" if IN_TEST && task
      Task.find(task).destroy if task
    when "complete"
      puts "completed" if IN_TEST && task
      Task.find(task).completed = true if task
    else
      puts "help" if IN_TEST
      Viewer.help
    end
  end
end

Controller.new

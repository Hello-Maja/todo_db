require_relative '../models/task.rb'

class Controller 
  attr_accessor :control_flow, :task

  def initialize
    run! if validated
    Viewer.help
  end

  def validated
    unless ARGV.empty?
      self.control_flow = ARGV.shift
      self.task = ARGV.join unless ARGV.empty?
      return true 
    end
    false
  end

  def run!
    
    case control_flow
    
    when "add"
    
    when "list"

    when "remove"

    when "complete"

    else

    end
  end
end

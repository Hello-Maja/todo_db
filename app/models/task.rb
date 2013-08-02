require_relative '../../config/application.rb'

class Task < ActiveRecord::Base
  validates_presence_of :description
end

require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
	@@Product=[]
  # Your code goes here!
  def self.create(option={})
  	self.new(option)
  end
  def self.all
  	@@Product
  end
end

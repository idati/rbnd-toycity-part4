require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
	@@Product=[]
	@@check=false
  # Your code goes here!
  def self.create(option={})
  	#puts option[:check2]
  	#(option[:check2])=="true" ? @@Product=[] : @@Product << self.new(option) 
  	@@Product << self.new(option)
  	@@Product[@@Product.length-1]
  end
  def self.all
  	#puts @@Product.length
  	@@Product
  end
  def self.clean
    #puts @@Product.length
  	@@Product=[]
    #puts @@Product.length
  end
end

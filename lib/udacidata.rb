require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = File.dirname(__FILE__) +"/../data/data.csv"
	create_finder_methods("name","brand","price")
  @@Product=[]
	@@result=[]
  # Your code goes here!
  def self.create(option={})
  	@@Product << self.new(option)
  	@@Product[@@Product.length-1]
  end
  def self.all
  	@@Product
  end
  def self.clean
  	@@Product=[]
  end
  def self.first(opt={})
    opt=={} ? @@Product[0] : @@Product[00..opt-1]
  end
  def self.last(opt={})
    n=@@Product.length-1
    opt=={} ? @@Product[n]: @@Product[(n-opt+1)..n]
  end
  def self.find(id)
    @@Product.detect{|item| item.id == id} ?  @@Product.detect{|item| item.id == id} : (raise UdacidataErrors::ProductNotFoundError, "id: #{id} not found")
  end

  def self.destroy(id)
    @@Product.find{|item| item.id==id} ? before=@@Product.clone : (raise UdacidataErrors::ProductNotFoundError, "id: #{id} not found")
    
    @@Product.delete_if{|item| item.id == id}

    update1
    @@Product.each{|pd| update2(pd.id, pd.brand, pd.name, pd.price)}
    #end
    @@result=(before-@@Product)
    @@result[0]
  end
  def self.where(opt={})
    result=[]
    @@Product.each{|item| (item.brand == opt[:brand]) ? result<<item : ""} if opt[:brand]
    @@Product.each{|item| (item.name == opt[:name]) ? result<<item : ""} if opt[:name]
    result
  end
  def update(opt={})
    Product.destroy(self.id)
    Product.create(id: self.id,brand: (opt[:brand] ? opt[:brand] : self.brand),name: (opt[:name] ? opt[:name] : self.name),price: (opt[:price] ? opt[:price] : self.price))
  end

end

require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = File.dirname(__FILE__) +"/../data/data.csv"
	@@Product=[]
	@@result=[]
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
  def self.first(opt={})
    opt=={} ? @@Product[0] : @@Product[00..opt-1]
  end
  def self.last(opt={})
    n=@@Product.length-1
    opt=={} ? @@Product[n]: @@Product[(n-opt+1)..n]
  end
  def self.find(id)
    @@Product.detect{|item| item.id == id}
  end
  def self.find_by_brand(brand)
    @@Product.detect{|item| item.brand == brand}
  end
  def self.find_by_name(name)
    @@Product.detect{|item| item.name == name}
  end

  def self.destroy(id)
    before=@@Product.clone
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
    #@@Product.each{|item| item.id==self.id ? (puts item.id) : ""} if opt[:brand]
    #@@Product.each{|item| item.id==self.id ? item.name = opt[:name] : ""} if opt[:name]
    #@@Product.each{|item| item.id==self.id ? (item.price = opt[:price]) : ""} if opt[:price]

    #update(opt)
  end

end

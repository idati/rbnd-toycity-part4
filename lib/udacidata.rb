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

  def self.take_items(from, n=nil)
      n ? all.send(from, n) : all.public_send(from)
  end

  def self.first(n=nil)
      self.take_items(:first, n)
  end

  def self.last(n=nil)
     self.take_items(:last, n)
  end

  def self.find(id)
    Product.all.detect{|item| item.id == id} ?  Product.all.detect{|item| item.id == id} : (raise UdacidataErrors::ProductNotFoundError, "id: #{id} not found")
  end

  def self.destroy(id)
    self.find(id) ? before=Product.all.clone : (raise UdacidataErrors::ProductNotFoundError, "id: #{id} not found")
    
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

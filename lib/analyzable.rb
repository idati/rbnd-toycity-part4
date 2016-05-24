module Analyzable 
  # Your code goes here!
  def average_price(input)
  	(input.inject(0){|sum, product| sum + product.price.to_f}/input.size).round(2)
  	#result=0
  	#input.each{|item, variable| result+=item.price.to_f }
  	#(result/input.length).round(2)
  end

  def count_by_brand(input)
    result = {}
    input.each {|item| result["#{item.brand}"] ? (result["#{item.brand}"]+=1) : (result["#{item.brand}"]=1)}
    result
  end

  def count_by_name(input)
  	result = {}
    input.each {|item| result["#{item.name}"] ? (result["#{item.name}"]+=1) : (result["#{item.name}"]=1)}
    result
  end

  def print_report(input)
  	uniq_brand=[]
  	uniq_name=[]
  	input.each{|item| uniq_brand << item.brand}
  	input.each{|item| uniq_name << item.name}
  	uniq_brand=uniq_brand.uniq
  	uniq_name=uniq_name.uniq
  	puts "  Inventory by Brand:"
  	uniq_brand.each{|item| puts "	- #{count_by_brand(Product.where(brand: item)).keys[0]}: #{count_by_brand(Product.where(brand: item)).values[0]}"}
  	puts "  Inventory by Name:"
  	uniq_name.each{|item| puts "	- #{count_by_name(Product.where(name: item)).keys[0]}: #{count_by_name(Product.where(name: item)).values[0]}"}
  	result = "  Average Price #{average_price(input)}"
  end

end

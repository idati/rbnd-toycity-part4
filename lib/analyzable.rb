module Analyzable 
  # Your code goes here!
  def average_price(input)
  	result=0
  	input.each{|item, variable| result+=item.price }
  	(result/input.length).round(2)
  end

end

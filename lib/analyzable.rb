module Analyzable 
  # Your code goes here!
  def average_price(input)
  	result=0
  	input.each{|item, variable| result+=item.price }
  	(result/input.length).round(2)
  end

  def count_by_brand(input)
  	count=0
  	input.each{|item, variable| count+=1}
  	Hash.[]("#{input[0].brand}"=>count)
  end
  def count_by_name(input)
  	count=0
  	input.each{|item, variable| count+=1}
  	Hash.[]("#{input[0].name}"=>count)
  end

end

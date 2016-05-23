require_relative 'udacidata'

class Product < Udacidata
  @@file = File.dirname(__FILE__) + "/../data/data.csv"
  puts File.dirname(__FILE__)+ "/../data/data.csv"
  #@@file = "data/data.csv"
  attr_reader :id, :price, :brand, :name

  def initialize(opts={})
    # Get last ID from the database if ID exists
    get_last_id
    # Set the ID if it was passed in, otherwise use last existing ID
    @id = opts[:id] ? opts[:id].to_i : @@count_class_instances
    # Increment ID by 1
    auto_increment if !opts[:id]
    # Set the brand, name, and price normally
    @brand = opts[:brand]
    @name = opts[:name]
    @price = opts[:price]
    #puts @name
    write_to_file(@id,@brand,@name,@price)
  end

  private

    # Reads the last line of the data file, and gets the id if one exists
    # If it exists, increment and use this value
    # Otherwise, use 0 as starting ID number
    def get_last_id
      #file = File.dirname(__FILE__) + "/../data/data.csv"
      last_id = File.exist?(@@file) ? CSV.read(@@file).last[0].to_i + 1 : nil
      @@count_class_instances = last_id || 0
    end


   # def file_to_array
   #     puts CSV.read(@@file).drop(1).length
   #     #CSV.foreach(@@file) do |row|
   #     #@@Product << row #first row would be ["animal", "count", "price"] - etc.
   #     #end
   # end
    def write_to_file(id,brand,product,price)
        #@data_path = File.dirname(__FILE__) +"/../data/data.csv"
        CSV.open(@@file, "a+") do |csv|
        csv << [id, brand, product, price]
        #@@Product << [id, brand, product, price]
        end
        #@@Product << self
      end

    def auto_increment
      @@count_class_instances += 1
    end

    def self.update1
      CSV.open(@@file, "wb") do |csv|
        csv << ["id", "brand", "product", "price"]
      end
    end
    def self.update2(id,brand,product,price)
      CSV.open(@@file, "a+") do |csv|
        csv << [id, brand, product, price]
        #@@Product << [id, brand, product, price]
      end
    end




end

class Module
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
        attributes.each do |attribute|
      self.class_eval("
        def self.find_by_#{attribute}(target_value)
          self.all.each do |item|
            if item.#{attribute} == target_value
              return item
            end
          end
        end
      ")
    end
  end
end

module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
# lib/my_enumerables.rb

class Array
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    result = []
    for item in self
      result << item if yield(item)
    end
    result
  end


  def my_all?
    for item in self
      if yield(item) == false
        return false
      end      
    end
    return true
  end
  
  def my_any?
    for item in self
      if yield(item) == true
        return true
      end      
    end
    return false
  end

  def my_none?
    for item in self
       return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    if !(block_given?)
      return self.length      
    end

    for item in self
      if yield(item)
        count += 1
      end
      
    end
    return count
  end

  def my_map
    array_return = []

    for item in self
      array_return << yield(item)
    end
    
    array_return
  end

  def my_inject(initial_value = nil)
    if initial_value == nil
      acc = self[0]
      rest = self[1..]
    else
      acc = initial_value
      rest = self
    end

    for item in rest
      acc = yield(acc, item)
    end
    acc 
  end
    



end

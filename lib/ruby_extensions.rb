class Hash
 
  # Return array from hash recursively sorted
  def to_sorted_array block=nil

    sort(&block).inject([]) do |array, (key, value)|
      array << [key, value.is_a?(Hash) ? value.to_sorted_array : value]
    end
  end
  
end

class Array
  
  # Recursively convert array to hash 
  def to_hash 
    inject({}) do |hash, (key, value)|
      value = value.to_hash if value.kind_of?(Array)
      hash.merge!({key => value})
    end
  end
  
end
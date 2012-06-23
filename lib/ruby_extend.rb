class Hash
   
  # Return array from hash recursively sorted
  def to_sorted_array block=nil
    sort(&block).inject([]) do |array, (key, value)|
      value = value.is_a?(Hash) ? value.to_sorted_array : value
      array << [key, value]
    end
  end
  
end

class Array
  require 'set'
  # Recursively convert array to hash 
  def to_hash 
    inject({}) do |hash, (key, value)|
      value = value.to_hash if value.kind_of?(Array)
      hash.merge!({key => value})
    end
  end
  
  def move(from, to)
    insert(to, delete_at(from))
    self
  end

  def included_in? array
    array.to_set.superset?(self.to_set)
  end

  def duplicates 
    uniq.map { |element| diff = (self.size - (self-[element]).size); (diff > 1) ? [element, diff] : nil}.compact
  end

  def map_with_index
    result = []
    each_with_index do |element, index|
      result << yield(element, index)
    end
    result
  end

  def average
    if self.respond_to?(:sum)
      sum.to_f / self.count
    else
      self.inject(:+).to_f / self.count
    end
  end

  def longest
    max = group_by(&:size).max
    max.last.pop if max
  end
  
end
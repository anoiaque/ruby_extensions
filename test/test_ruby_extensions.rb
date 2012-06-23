require 'test/unit'
require File.join(File.dirname(__FILE__),'../lib/ruby_extend')


class TestRubyExtensions < Test::Unit::TestCase


  def test_hash_to_sorted_array_with_empty_hash
    assert_equal [], {}.to_sorted_array
  end
  
  def test_hash_recursively_sorted_to_array
    hash = {'user' => {'adress' => {'town' => 'Paris', 'street' => "rue de Quimper"}, 'name' => 'toto', 'age' => 12}}
    expected = [["user", [["adress", [["street", "rue de Quimper"], ["town", "Paris"]]], ["age", 12], ["name", "toto"]]]]
    
    assert_equal expected, hash.to_sorted_array
  end
  
  def test_array_to_hash_with_empty_array
    assert_equal({}, [].to_hash)
  end
  
  def test_array_to_hash_recursively_extract_to_hashes
    array = [["user", [["adress", [["street", "rue de Quimper"], ["town", "Paris"]]], ["age", 12], ["name", "toto"]]]]
    expected = {"user"=>  {"name"=>"toto", "adress"=>{"street"=>"rue de Quimper", "town"=>"Paris"}, "age"=>12}}
    assert_equal expected, array.to_hash
  end
  
  def test_array_included_in
    assert [1, 3, 766, 9].included_in?([1, 3, 766, 9])
    assert [1, 3, 766, 9].included_in?([1, 3, 766, 9,10])
    assert ![1, 3, 4, 9].included_in?([1, 3, 766, 9])
  end
  
  def test_move_an_element_of_an_array
    a = [1, 2, 3, 4]
    assert_equal [2, 3, 4, 1], a.move(0, 3)
  end
  
  def test_duplicates
    assert_equal [[2, 2], [3, 3]], [1, 2, 4, 2, 3, 6, 3, 3].duplicates
    assert_equal [], [1, 2, 3, 4].duplicates
  end
  
  def test_map_with_index
    [1, 2, 3, 4].map_with_index do |n, index|
      assert_equal n, index + 1
    end
  end
  
  def test_average
    assert_equal 10, [0, 20].average
  end
  
  def test_longest
    assert_equal "hello", ["hello", "how", "are", "you"].longest
  end
  
end

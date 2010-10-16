require 'test/unit'
require File.join(File.dirname(__FILE__),'../lib/ruby_extensions')


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

  
end

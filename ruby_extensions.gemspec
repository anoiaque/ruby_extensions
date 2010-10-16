specifications = Gem::Specification.new do |spec| 
  spec.name = "ruby_extensions"
  spec.version = "1.0.0"
  spec.author = "Philippe Cantin"
  spec.homepage = "http://github.com/anoiaque/ruby_extensions"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "Extend some ruby core classes "
  spec.description = "Extend some ruby core classes "
  spec.files = Dir['lib/**/*.rb']
  spec.require_path = "lib"
  spec.test_files  = Dir['test/**/*.rb']
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README.rdoc"]
end
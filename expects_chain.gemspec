# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'expects_chain'
  s.version     = '0.0.1'
  s.date        = '2012-04-21'
  s.summary     = "RSpec extension that allows you to set chained expectations on objects."
  s.description = "RSpec extension that allows you to set chained expectations on objects. Currently supports mocha"
  s.authors     = ["Tomasz Pewiński"]
  s.email       = 'pewniak747@gmail.com'
  s.files       = %w{lib/expects_chain.rb lib/expects_chain/expectation.rb lib/expects_chain/mockers/mocha.rb lib/expects_chain/mockers/rspec.rb}
  s.homepage    = 'http://github.com/pewniak747/expects_chain'
end

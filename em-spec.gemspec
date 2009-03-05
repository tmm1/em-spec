spec = Gem::Specification.new do |s|
  s.name = 'em-spec'
  s.version = '0.1.2'
  s.date = '2009-02-15'
  s.summary = 'Bacon based BDD API for Ruby/EventMachine'
  s.email = "em-spec@tmm1.net"
  s.homepage = "http://github.com/tmm1/em-spec"
  s.description = 'Bacon based BDD API for Ruby/EventMachine'
  s.has_rdoc = false
  s.authors = ["Aman Gupta"]
  s.add_dependency('eventmachine', '>= 0.12.4')
  s.add_dependency('bacon', '>= 1.1.0')
  s.add_dependency('rspec', '>= 1.1.12')
  s.files = ["README",
             "lib/em/spec.rb",
             "lib/em/spec/bacon.rb",
             "lib/em/spec/rspec.rb",   
             "lib/ext/fiber18.rb",
             "test/bacon_spec.rb",
             "test/rspec_spec.rb"]
end

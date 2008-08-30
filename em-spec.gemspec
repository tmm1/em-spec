spec = Gem::Specification.new do |s|
  s.name = 'em-spec'
  s.version = '0.1.0'
  s.date = '2008-08-01'
  s.summary = 'Bacon based BDD API for Ruby/EventMachine'
  s.email = "em-spec@tmm1.net"
  s.homepage = "http://github.com/tmm1/em-spec"
  s.description = 'Bacon based BDD API for Ruby/EventMachine'
  s.has_rdoc = false
  s.authors = ["Aman Gupta"]
  s.add_dependency('eventmachine', '>= 0.12.0')

  # ruby -rpp -e "pp Dir['{README,{examples,lib,protocol}/**/*.{json,rb,txt,xml}}'].map"
  s.files = ["README",
             "lib/em/emspec.rb",
             "lib/ext/em.rb",
             "lib/ext/fiber18.rb"]
end
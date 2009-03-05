task :gem => :gemspec do
  sh 'gem build em-spec.gemspec'
end

task :gemspec do
  
end

task :install => :gem do
  sh 'sudo gem install em-spec-*.gem'
end

task :default => :gem

task :spec do
  sh 'bacon test/bacon_spec.rb'
  sh 'spec -f specdoc test/rspec_spec.rb'
end
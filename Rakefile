task :gem => :gemspec do
  sh 'gem build em-spec.gemspec'
end

task :gemspec do
  
end

task :install => :gem do
  sh 'sudo gem install em-spec-*.gem'
end

task :default => :gem
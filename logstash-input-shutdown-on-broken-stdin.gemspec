Gem::Specification.new do |s|
  s.name = 'logstash-input-shutdown-on-broken-stdin'
  s.version         = '2.0.4'
  s.licenses = ['Apache License (2.0)']
  s.summary = "This is an extension of Stdin input plugin. This plugin exits Logstash on broken Stdin."
  s.description = "If Logstash is launched as a sub-process, this plugin can be used to exit Logstash when the parent process exits. The parent process should launch the Logstash sub-process using Inherit on Stdin, this way when the parent process exits, the Stdin is broken which is detected by this plugin which exits Logstash"
  s.authors = ["Elastic"]
  s.email = 'info@elastic.co'
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "input" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0", "< 3.0.0"
  s.add_runtime_dependency 'logstash-input-stdin'
  
  s.add_development_dependency 'logstash-devutils'
end

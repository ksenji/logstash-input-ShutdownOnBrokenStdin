# encoding: utf-8
require "logstash/inputs/stdin"

# This plugin can be used to exit Logstash when Logstash is lauched as a 
# sub-process and the parent process dies. The sub-process should be launched
# inheriting the STDIN from the parent process and so if the parent process
# dies, this plugin would see a broken input and it would simply exit Logstash

class LogStash::Inputs::ShutdownOnBrokenStdin < LogStash::Inputs::Stdin
  config_name "shutdown_on_broken_stdin"

  def run(queue)
    begin
      super
    rescue => e
      puts "Detected broken Stdin. Exiting Logstash"
      exit
    end
  end
end

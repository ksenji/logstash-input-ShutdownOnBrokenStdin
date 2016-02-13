# encoding: utf-8
require "logstash/devutils/rspec/spec_helper"
require "logstash/inputs/shutdown_on_broken_stdin"
require "logstash/inputs/stdin"

describe LogStash::Inputs::ShutdownOnBrokenStdin < LogStash::Inputs::Stdin do
 # No tests as this is nothing but a LogStash::Inputs::Stdin
end

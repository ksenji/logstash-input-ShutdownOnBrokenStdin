This plugin will be useful when Logstash is launched via another Process (Agent). The Agent can connect to a central repository like (etcd) to get the Logstash config file. The advantage of having an Agent download the config file from a central repository is to have the updates to the config file (like Kafka brokers for example) propagated to all Logstash instances. The Agent can be managed by a supervisorctl or an inittab. 

Agent would be started on the box which connects to the central config system to get the config file for Logstash and launches Logstash as a sub-process. The agent can be notified of changes from the config system which can kill Logstash and restart Logstash again. When an Agent quits for whatever reason, Logstash sub-process can be killed by using this Input plugin.

<pre><code>
input {
  shutdown_on_broken_stdin {
    type => "DROP"
  }
  
  kafka {
    topic_id => "test"
    zk_connect => "localhost:2181"
  }
}

filter {
  if [type] == "DROP" {
    drop {
      # Drop the messages coming on "Stdin"
    }
  }
}

output {
  stdout {
    codec => rubydebug
  }
}
</code></pre>

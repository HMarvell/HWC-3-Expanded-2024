echo "- pipeline.id: pipeline1
  config.string: input { beats { port => 5044 } } output { pipeline { send_to => ['pipeline2'] } }
- pipeline.id: pipeline2
  config.string: input { pipeline { address => pipeline2 } } output { pipeline { send_to => ['pipeline3'] } }
- pipeline.id: pipeline3
  config.string: input { pipeline { address => pipeline3 } } output { elasticsearch { hosts => ['${PRIVATE_IP_ES}:9200'] data_stream => 'true' } }
  " >> /etc/logstash/pipelines.yml

systemctl start logstash

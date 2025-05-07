ELASTICYML="action.auto_create_index: .monitoring*,.watches,.triggered_watches,.watcher-history*,.ml*
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch

network.host: '${PRIVATE_IP}'
http.port: 9200

xpack.security.enabled: false
xpack.security.enrollment.enabled: false

xpack.security.http.ssl:
  enabled: false
  keystore.path: certs/http.p12

xpack.security.transport.ssl:
  enabled: false
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12

cluster.initial_master_nodes: ['${PRIVATE_IP}']

http.host: '${PRIVATE_IP}'"
echo "$ELASTICYML" > /etc/elasticsearch/elasticsearch.yml

systemctl start elasticsearch

echo "server.port: 5601
server.host: "0.0.0.0"

elasticsearch.hosts: 'http://${PRIVATE_IP}:9200'
" >> /etc/kibana/kibana.yml
systemctl start kibana

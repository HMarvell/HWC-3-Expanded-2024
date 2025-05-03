sed -i -e 's+#server.port:+server.port+g' /etc/kibana/kibana.yml
sed -i -e 's+#server.host: "localhost"+server.host: "0.0.0.0"+g' /etc/kibana/kibana.yml
sed -i -e 's+#elasticsearch.hosts: ["http://localhost:9200"]+elasticsearch.hosts: 'http://${PRIVATE_IP}:9200'+g' /etc/kibana/kibana.yml

systemctl start kibana

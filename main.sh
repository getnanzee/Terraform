echo "cluster.name: elasticsearch" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: [_local_, _site_]" >> /etc/elasticsearch/elasticsearch.yml
echo "node.attr.zone: 1" >> /etc/elasticsearch/elasticsearch.yml
echo "node.name: master" >> /etc/elasticsearch/elasticsearch.yml
echo "node.master: true" >> /etc/elasticsearch/elasticsearch.yml
echo "node.data: false" >> /etc/elasticsearch/elasticsearch.yml
echo "node.ingest: true" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.ping.unicast.hosts: ["'$Node1'","'$Node2'"]" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.minimum_master_nodes: 1" >> /etc/elasticsearch/elasticsearch.yml
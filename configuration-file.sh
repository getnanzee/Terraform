#!/bin/bash

if [ ${nodename} == "master" ] ; then

# Configuration for Elasticsearch nodes to find each other
echo "cluster.name: elasticsearch-cluster" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.hosts_provider: ec2" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.endpoint: ec2.us-west-1.amazonaws.com" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: [_ec2_,_local_]" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.tag.es_cluster: es" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.minimum_master_nodes: 1" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.host_type: private_ip" >> /etc/elasticsearch/elasticsearch.yml
echo "node.name: $nodename" >> /etc/elasticsearch/elasticsearch.yml
echo "cluster.initial_master_nodes: ["$nodename"]" >> /etc/elasticsearch/elasticsearch.yml
echo "node.master: true" >> /etc/elasticsearch/elasticsearch.yml
echo "node.data: false" >> /etc/elasticsearch/elasticsearch.yml
echo "node.ingest: true" >> /etc/elasticsearch/elasticsearch.yml

else

# Configuration for Elasticsearch nodes to find each other
echo "cluster.name: elasticsearch-cluster" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.hosts_provider: ec2" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.endpoint: ec2.us-west-1.amazonaws.com" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: [_ec2_,_local_]" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.tag.es_cluster: es" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.minimum_master_nodes: 1" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.ec2.host_type: private_ip" >> /etc/elasticsearch/elasticsearch.yml
echo "cluster.initial_master_nodes: ["master"]" >> /etc/elasticsearch/elasticsearch.yml
echo "node.master: false" >> /etc/elasticsearch/elasticsearch.yml
echo "node.data: true" >> /etc/elasticsearch/elasticsearch.yml
echo "node.ingest: false" >> /etc/elasticsearch/elasticsearch.yml
echo "node.name: $nodename" >> /etc/elasticsearch/elasticsearch.yml

fi
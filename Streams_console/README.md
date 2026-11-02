# Operator installation
1. Install Streams Operator
2. Install Streams Console Operator

# Deployments

3. oc apply -f kafka_cluster.yaml
4. sh deploy_console.sh

# Access
Retrieve host with
`oc get routes | grep console`

# Test

~~~
#Bash into the pod
oc exec -it kafka-cluster-broker-0 -n streams -- /bin/bash

#Create SCRAM auth
echo -e "security.protocol=SASL_PLAINTEXT\nsasl.mechanism=SCRAM-SHA-512\nsasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required username=\"console-kafka-user\" password=\"mypassword\";" > /tmp/client.properties

#Create topic
bin/kafka-topics.sh --create --topic test-cli-topic      --bootstrap-server localhost:9092      --command-config /tmp/client.properties      --partitions 3      --replication-factor 3

# Produce:

bin/kafka-console-producer.sh --topic test-cli-topic \
  --bootstrap-server localhost:9092 \
  --producer.config /tmp/client.properties

# Consume:

bin/kafka-console-consumer.sh --topic test-cli-topic --from-beginning \
  --bootstrap-server localhost:9092 \
  --consumer.config /tmp/client.properties
~~~

# Requirements
1. Streams for Apache Kafka Operator installed
2. Streams for Apache Kafka Conbsole Operator installed

# Deployments
Kafka Cluster
~~~
oc apply -f https://raw.githubusercontent.com/matdicarlo/Streams-for-Apache-Kafka/refs/heads/main/Streams_console/kafka_cluster.yaml?token=GHSAT0AAAAAADMLNY27HBO6ORARA663DXGC2HPMF6A
~~~

## Console
Set env variables
~~~
export KAFKA_CR_NAME="my-cluster"
export UI_CONSOLE_URL="my-console-ui.apps.mdicarlo-test.emea.aws.cee.support"
export NAMESPACE="strimzi"
export KAFKA_LISTENER_NAME="plain"
export KAFKA_CONSOLE_USER="console-kafka-user"
~~~

Deploy Console

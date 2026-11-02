# Requirements
1. Streams for Apache Kafka Operator installed
2. Streams for Apache Kafka Conbsole Operator installed

# Deployments
Kafka Cluster
~~~
<<<<<<< HEAD
oc apply -f https://raw.githubusercontent.com/matdicarlo/Streams-for-Apache-Kafka/refs/heads/main/Streams_console/kafka_cluster.yaml?token=GHSAT0AAAAAADMLNY27HBO6ORARA663DXGC2HPMF6A
=======
oc apply -f https://raw.githubusercontent.com/.yaml

>>>>>>> fb73647 (add cluster.yaml)
~~~

## Console
Set env variables
~~~
export KAFKA_CR_NAME="kafka-cluster"
export NAMESPACE="streams"
export KAFKA_LISTENER_NAME="plain"
export KAFKA_CONSOLE_USER="console-kafka-user"
export BASE_DOMAIN=$(oc get route kafka-cluster-kafka-bootstrap -n streams -o jsonpath='{.spec.host}' | cut -d'.' -f2-)
export UI_CONSOLE_URL="my-console-ui.apps.${BASE_DOMAIN}"
~~~

Deploy Console

~~~
cat <<'EOF' | envsubst | oc apply -f -
apiVersion: console.streamshub.github.com/v1
kind: Console
metadata:
  name: my-console
spec:
  hostname: $UI_CONSOLE_URL
  kafkaClusters:
    - name: $KAFKA_CR_NAME
      namespace: $NAMESPACE
      listener: $KAFKA_LISTENER_NAME
      credentials:
        kafkaUser:
          name: $KAFKA_CONSOLE_USER
EOF
~~~

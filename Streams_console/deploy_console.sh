#!/bin/bash

export KAFKA_CR_NAME="kafka-cluster"
export NAMESPACE="streams"
export KAFKA_LISTENER_NAME="plain"
export KAFKA_CONSOLE_USER="console-kafka-user"
export BASE_DOMAIN=$(oc get route kafka-cluster-kafka-bootstrap -n streams -o jsonpath='{.spec.host}' | cut -d'.' -f2-)
export UI_CONSOLE_URL="my-console-ui.apps.${BASE_DOMAIN}"

cat <<'EOF' | envsubst | oc apply -f -
apiVersion: console.streamshub.github.com/v1alpha1
kind: Console
metadata:
  name: my-console
  namespace: streams
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

oc create role console-kafkauser-secret-reader --namespace=streams --verb=get --resource=secrets --resource-name=console-kafka-user &&  oc create rolebinding console-kafkauser-secret-reader --namespace=streams --role=console-kafkauser-secret-reader --serviceaccount=streams:my-console-console-serviceaccount

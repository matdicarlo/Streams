# Requirement
1. Kafka Cluster running and deployed:
~~~
oc apply -f 
~~~

# Steps to install and configure
1. Install the Strams Console Operator
2. Set env variables
~~~
export KAFKA_CR_NAME="my-cluster"
export UI_CONSOLE_URL="my-console-ui.apps.mdicarlo-test11.emea.aws.cee.support"
export NAMESPACE="strimzi"
export KAFKA_LISTENER_NAME="plain"
export KAFKA_CONSOLE_USER="console-kafka-user"
~~~

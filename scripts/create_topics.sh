#!/bin/bash

# if it does not work 
# start kafka (zookeeper and kafka) manualy or by 


# Create the OrderReceived topic
#$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic OrderReceived --config retention.ms=259200000 

# Create the OrderConfirmed topic
#$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic OrderConfirmed

# Create the OrderPickedAndPacked topic
#$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create -topic OrderPickedAndPacked

# Create the Notification topic
#$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic Notification

# Create the DeadLetterQueue topic
#$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic DeadLetterQueue

# create using docker
# Create the OrderReceived topic
docker exec -it scripts-kafka-1 kafka-topics.sh --bootstrap-server kafka:9092 --create --topic OrdersReceived --config retention.ms=259200000

# Create the OrderConfirmed topic
docker exec -it scripts-kafka-1 kafka-topics.sh --create --bootstrap-server localhost:9092 --topic OrderConfirmed

# Create the OrderPickedAndPacked topic
docker exec -it scripts-kafka-1 kafka-topics.sh --create --bootstrap-server localhost:9092 --topic OrderPickedAndPacked

# Create the Notification topic
docker exec -it scripts-kafka-1 kafka-topics.sh --create --bootstrap-server localhost:9092 --topic Notification

# Create the DeadLetterQueue topic
docker exec -it scripts-kafka-1 kafka-topics.sh --create --bootstrap-server localhost:9092 --topic DeadLetterQueue


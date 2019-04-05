#!/bin/bash
export PYSPARK_DRIVER_PYTHON=ipython pyspark

rm /home/ubuntu/airflow/airflow-scheduler.pid
rm /home/ubuntu/airflow/airflow-webserver.pid 
rm /home/ubuntu/airflow/airflow-webserver-monitor.pid 

airflow webserver -D &
airflow scheduler -D &

sudo -u ubuntu /home/ubuntu/elasticsearch/bin/elasticsearch -d

# not needed till chapter 8
echo "Running Zookeeper as a daemon ..." | tee -a $LOG_FILE
sudo -H -u ubuntu /home/ubuntu/kafka/bin/zookeeper-server-start.sh -daemon /home/ubuntu/kafka/config/zookeeper.properties
echo "Running Kafka Server as a daemon ..." | tee -a $LOG_FILE
sudo -H -u ubuntu /home/ubuntu/kafka/bin/kafka-server-start.sh -daemon /home/ubuntu/kafka/config/server.properties


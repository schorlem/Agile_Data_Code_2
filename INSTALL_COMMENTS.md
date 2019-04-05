## Install solutions  
Updated several packages in install script ec2_bootstrap. However some packages are still broken. Solutions here: 

java not installing: [How to install the latest java version in Raspbian (Stretch) · GitHub](https://gist.github.com/ribasco/fff7d30b31807eb02b32bcf35164f11f)

Airflow:  
sudo chown -R ubuntu anaconda
export AIRFLOW_GPL_UNIDECODE=yes
pip install apache-airflow[hive]
The pid files in the airflow folder can become read only and airflow won't be able to start. Just delete them when that happens

elasticsearch 5.2.1 broken:
install newest version current 6.4.1: [ES doesn't start due to a problem with REGEX matching of entries in '/proc/self/cgroup' · Issue #23218 · elastic/elasticsearch · GitHub](https://github.com/elastic/elasticsearch/issues/23218)

spark:  https://blog.sicara.com/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f
jupyter not running: https://stackoverflow.com/questions/48090119/jupyter-notebook-typeerror-init-got-an-unexpected-keyword-argument-io-l

kafka too old file doesn't exist any longer:
go to [Index of /kafka](http://apache.mirrors.lucidnetworks.net/kafka/) and find closes release to default version.

mongo hadoop:
```
cd /home/ubuntu/Agile_Data_Code_2/lib/
wget http://central.maven.org/maven2/org/mongodb/mongo-java-driver/3.4.2/mongo-java-driver-3.4.2.jar

cd /tmp
wget https://github.com/mongodb/mongo-hadoop/archive/r2.0.2.tar.gz
<https://github.com/mongodb/mongo-hadoop/archive/r2.0.2.tar.gz>

mkdir /home/ubuntu/mongo-hadoop
cd /home/ubuntu
tar -xvzf /tmp/mongo-hadoop-r2.0.2.tar.gz -C mongo-hadoop --strip-components=1

# Now build the mongo-hadoop-spark jars
echo "Building mongo-hadoop-spark jars ..." | tee -a $LOG_FILE
cd /home/ubuntu/mongo-hadoop
./gradlew jar
cp /home/ubuntu/mongo-hadoop/spark/build/libs/mongo-hadoop-spark-*.jar /home/ubuntu/Agile_Data_Code_2/lib/
cp /home/ubuntu/mongo-hadoop/build/libs/mongo-hadoop-*.jar /home/ubuntu/Agile_Data_Code_2/lib/
cd /home/ubuntu

# Now build the pymongo_spark package
echo "Building the pymongo_spark package ..." | tee -a $LOG_FILE
cd /home/ubuntu/mongo-hadoop/spark/src/main/python
python setup.py install
cp /home/ubuntu/mongo-hadoop/spark/src/main/python/pymongo_spark.py /home/ubuntu/Agile_Data_Code_2/lib/
export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib
echo "" | sudo tee -a /home/ubuntu/.bash_profile
echo 'export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib' | sudo tee -a /home/ubuntu/.bash_profile
cd /home/ubuntu
```

if still not working: `sudo apt-get install python-pymongo`

Mongo Hadoop:
```
cd /home/ubuntu/Agile_Data_Code_2/lib/
wget http://central.maven.org/maven2/org/mongodb/mongo-java-driver/3.4.2/mongo-java-driver-3.4.2.jar

cd /tmp
wget https://github.com/mongodb/mongo-hadoop/archive/r2.0.2.tar.gz
<https://github.com/mongodb/mongo-hadoop/archive/r2.0.2.tar.gz>

mkdir /home/ubuntu/mongo-hadoop
cd /home/ubuntu
tar -xvzf /tmp/mongo-hadoop-r2.0.2.tar.gz -C mongo-hadoop --strip-components=1

# Now build the mongo-hadoop-spark jars
echo "Building mongo-hadoop-spark jars ..." | tee -a $LOG_FILE
cd /home/ubuntu/mongo-hadoop
./gradlew jar
cp /home/ubuntu/mongo-hadoop/spark/build/libs/mongo-hadoop-spark-*.jar /home/ubuntu/Agile_Data_Code_2/lib/
cp /home/ubuntu/mongo-hadoop/build/libs/mongo-hadoop-*.jar /home/ubuntu/Agile_Data_Code_2/lib/
cd /home/ubuntu

# Now build the pymongo_spark package
echo "Building the pymongo_spark package ..." | tee -a $LOG_FILE
cd /home/ubuntu/mongo-hadoop/spark/src/main/python
python setup.py install
cp /home/ubuntu/mongo-hadoop/spark/src/main/python/pymongo_spark.py /home/ubuntu/Agile_Data_Code_2/lib/
export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib
echo "" | sudo tee -a /home/ubuntu/.bash_profile
echo 'export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib' | sudo tee -a /home/ubuntu/.bash_profile
cd /home/ubuntu
```


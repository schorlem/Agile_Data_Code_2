#!/bin/bash
export PYSPARK_DRIVER_PYTHON=ipython pyspark

MONGOHADOOP_VERSION=2.0.2
MONGOJAVA_VERSION=3.4.2
#
# The names of the JAR files can then be pieced together
# from the version strings.
#
MONGOHADOOPSPARK_JAR=./lib/mongo-hadoop-spark-$MONGOHADOOP_VERSION.jar
MONGOJAVADRIVER_JAR=./lib/mongo-java-driver-$MONGOJAVA_VERSION.jar
MONGOHADOOP_JAR=./lib/mongo-hadoop-$MONGOHADOOP_VERSION.jar 

#
# You can then launch the pyspark session using the following
# shell command from the Agile_Data_Code_2 directory:
#
pyspark --jars $MONGOHADOOPSPARK_JAR,$MONGOJAVADRIVER_JAR,$MONGOHADOOP_JAR --driver-class-path $MONGOHADOOPSPARK_JAR:$MONGOJAVADRIVER_JAR:$MONGOHADOOP_JAR


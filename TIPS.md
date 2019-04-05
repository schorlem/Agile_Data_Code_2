# Tips an tricks for usage of agile ds code 

Kafka streaming in ch08 not working yet getting cryptic error. 

## Startup
* Run create tunnel script on laptop
* Start elasticsearch on ec2

## Running pyspark
mongo db use spyspark_mongo.sh variables need to be set.

to submit jobs as scripts:
[python - How to run a script in PySpark - Stack Overflow](https://stackoverflow.com/questions/40028919/how-to-run-a-script-in-pyspark)
[ipython notebook - Spark context 'sc' not defined - Stack Overflow](https://stackoverflow.com/questions/30763951/spark-context-sc-not-defined)
 ```
from pyspark import SparkContext
sc =SparkContext()
 ```
 problem is that need to add jars etc.:
 [python - pyspark: ship jar dependency with spark-submit - Stack Overflow](https://stackoverflow.com/questions/29433428/pyspark-ship-jar-dependency-with-spark-submit)
 
 how to add jars with spark-submit:

```
spark-submit --jars /home/ubuntu/elasticsearch-hadoop/dist/elasticsearch-hadoop-mr-6.1.3.jar ch02/pyspark_elasticsearch.py 
```
 
for chapter  4 used different jar to save to elasticsearch:

```
pyspark --jars /home/ubuntu/elasticsearch-hadoop/dist/elasticsearch-hadoop-6.1.3.jar
```
 
pyspark kafka streaming see page 57

if you want to run from jupyter python use findspark package.

In chapter 5 extract_airplanes.py pyspark runs out of memory. Increase memory with: 

```
pyspark --num-executors 2 --driver-memory 6g --executor-memory 4g
```

Links: [apache spark - Increase memory available to PySpark at runtime - Stack Overflow](https://stackoverflow.com/questions/31464727/increase-memory-available-to-pyspark-at-runtime)
[configuration - How to find out the amount of memory pyspark has from iPython interface? - Stack Overflow](https://stackoverflow.com/questions/29290573/how-to-find-out-the-amount-of-memory-pyspark-has-from-ipython-interface)

In chapter 6 resolve_airplane_manufacturer fails due to spark bug. Resolution here: [scala - Why does Spark fail with "Detected cartesian product for INNER join between logical plans"? - Stack Overflow](https://stackoverflow.com/questions/44762353/why-does-spark-fail-with-detected-cartesian-product-for-inner-join-between-logi) 

```
spark.conf.set("spark.sql.crossJoin.enabled", "true")
```

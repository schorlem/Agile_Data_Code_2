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


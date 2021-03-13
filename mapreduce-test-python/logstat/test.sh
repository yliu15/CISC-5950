#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/logstat/mapper.py -mapper ../../mapreduce-test-python/logstat/mapper.py \
-file ../../mapreduce-test-python/logstat/reducer.py -reducer ../../mapreduce-test-python/logstat/reducer.py \
-input /logstat/input/* -output /logstat/output/
/usr/local/hadoop/bin/hdfs dfs -cat /logstat/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/output/
../../stop.sh

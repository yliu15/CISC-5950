#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /round1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /round1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/part1/round1/mapper.py -mapper ../../mapreduce-test-python/part1/round1/mapper.py \
-file ../../mapreduce-test-python/part1/round1/reducer.py -reducer ../../mapreduce-test-python/part1/round1/reducer.py \
-input /round1/input/* -output /round1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /round1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/output/
../../stop.sh

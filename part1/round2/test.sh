#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /round2/input/
/usr/local/hadoop/bin/hdfs dfs -cp /round1/output/part-00000 /round2/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-D mapred.reduce.tasks=0 \
-input /round2/input/* -output /round2/output/ \
-file ../../part1/round2/mapper.py -mapper ../../part1/round2/mapper.py
/usr/local/hadoop/bin/hdfs dfs -cat /round2/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/output/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/output/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round2/output/
../../stop.sh

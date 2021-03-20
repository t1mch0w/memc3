#!/bin/bash
# Please change this according to your ycsb installation
# so that, ${YCSB_HOME}/bin/ycsb is the binary 
YCSB_HOME=/mnt/YCSB
MEMC3=/mnt/memc3/bench/

cd $YCSB_HOME
for setting in `ls $MEMC3/ycsb_workload_settings`
do
    echo using predefined workloadb to create transaction records for $setting with 5% updates
    echo generateing $setting.load, the insertions used before benchmark
    #${YCSB_HOME}/bin/ycsb load basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.load
    echo generateing $setting.run, the lookup queries used before benchmark
    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run

    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run1 & 
    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run2 &
    ${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run3 &
    ${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run4 &
    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run5 &
    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P $MEMC3/ycsb_workload_settings/$setting > $setting.run6 &

    #echo using predefined workloadc to create transaction records for $setting with reads only 
    #echo generateing $setting.load, the insertions used before benchmark
    #${YCSB_HOME}/bin/ycsb load basic -P ${YCSB_HOME}/workloads/workloadc -P ./workloads/$setting.dat > $setting.load
    #echo generateing $setting.run, the lookup queries used before benchmark
    #${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadc -P ./workloads/$setting.dat > $setting.run

	wait
done

wait

mv *.load $MEMC3/
mv *.run* $MEMC3/

cd $MEMC3

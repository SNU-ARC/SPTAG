#!/bin/bash
PERF="perf stat -e" 
PERF_OPT="LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores,L1-dcache-loads,L1-dcache-stores,mem_inst_retired.all_loads,mem_inst_retired.all_stores,mem_load_retired.l3_hit,mem_load_retired.l3_miss,instructions,offcore_requests_buffer.sq_full,fp_arith_inst_retired.256b_packed_single,GFLOPS,Load_Miss_Real_latency,CPI"

echo "Perform SPTAG profiling..."
if [ $# == 2 ]; then
  $PERF $PERF_OPT -o $1_$2.perf ./run.sh $1 $2
elif [ $1 = "all" ]; then
  $PERF $PERF_OPT -o sift_kdt.perf ./run.sh sift kdt
  $PERF $PERF_OPT -o sift_bkt.perf ./run.sh sift bkt
  $PERF $PERF_OPT -o gist_kdt.perf ./run.sh gist kdt
  $PERF $PERF_OPT -o gist_bkt.perf ./run.sh gist bkt
else
  echo "Usage: ./perf.sh [dataset] [graph]"
  echo "e.g. ./perf.sh sift kdt"
fi


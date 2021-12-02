#!/bin/bash
export TIME=$(date '+%Y%m%d%H%M')
if [ $# == 2 ]; then
  if [ $1 = "sift" ]; then
    if [ $2 = "kdt" ]; then
      # Search Sift1M_KDT
      ./indexsearcher -d 128 -v float -f XVEC \
        -i ../datasets/sift1M/sift_base.fvecs \
        -r ../datasets/sift1M/sift_groundtruth.ivecs \
        -x sift1M_index_KDT -o sift1M_KDT.sptag \
        -k 200  > sift1M_KDT_search_${TIME}.log
      #  -m 10 -k 200 -b 1
    elif [ $2 = "bkt" ]; then
      # Search Sift1M_BKT
      ./indexsearcher -d 128 -v float -f XVEC \
        -i ../datasets/sift1M/sift_base.fvecs \
        -r ../datasets/sift1M/sift_groundtruth.ivecs \
        -x sift1M_index_BKT -o sift1M_BKT.sptag \
        -k 200 > sift1M_BKT_search_${TIME}.log
      #  -m 10 -k 200 -b 1
    else
      echo "ERROR: Wrong method!"
    fi
  elif [ $1 = "gist" ]; then
    if [ $2 = "kdt" ]; then
      # Search Gist1M_KDT
      ./indexsearcher -d 960 -v float -f XVEC \
        -i ../datasets/gist1M/gist_base.fvecs \
        -r ../datasets/gist1M/gist_groundtruth.ivecs \
        -x gist1M_index_KDT -o gist1M_KDT.sptag \
        -k 400 > gist1M_KDT_search_${TIME}.log
      #  -m 12 -k 400 -b 1
    elif [ $2 = "bkt" ]; then
      # Search Gist1M_BKT
      ./indexsearcher -d 960 -v float -f XVEC \
        -i ../datasets/gist1M/gist_base.fvecs \
        -r ../datasets/gist1M/gist_groundtruth.ivecs \
        -x gist1M_index_BKT -o gist1M_BKT.sptag \
        -k 400 > gist1M_BKT_search_${TIME}.log
      #  -m 12 -k 400 -b 1
    else
      echo "ERROR: Wrong method!"
    fi
  else
    echo "ERROR: Wrong dataset!"
  fi
elif [ $1 = "all" ]; then
  # Search Sift1M_KDT
  ./indexsearcher -d 128 -v float -f XVEC \
    -i ../datasets/sift1M/sift_base.fvecs \
    -r ../datasets/sift1M/sift_groundtruth.ivecs \
    -x sift1M_index_KDT -o sift1M_KDT.sptag \
    -k 200  > sift1M_KDT_search_${TIME}.log
  #  -m 10 -k 200 -b 1
  
  # Search Sift1M_BKT
  ./indexsearcher -d 128 -v float -f XVEC \
    -i ../datasets/sift1M/sift_base.fvecs \
    -r ../datasets/sift1M/sift_groundtruth.ivecs \
    -x sift1M_index_BKT -o sift1M_BKT.sptag \
    -k 200 > sift1M_BKT_search_${TIME}.log
  #  -m 10 -k 200 -b 1
  
  # Search Gist1M_KDT
  ./indexsearcher -d 960 -v float -f XVEC \
    -i ../datasets/gist1M/gist_base.fvecs \
    -r ../datasets/gist1M/gist_groundtruth.ivecs \
    -x gist1M_index_KDT -o gist1M_KDT.sptag \
    -k 400 > gist1M_KDT_search_${TIME}.log
  #  -m 12 -k 400 -b 1
  
  # Search Gist1M_BKT
  ./indexsearcher -d 960 -v float -f XVEC \
    -i ../datasets/gist1M/gist_base.fvecs \
    -r ../datasets/gist1M/gist_groundtruth.ivecs \
    -x gist1M_index_BKT -o gist1M_BKT.sptag \
    -k 400 > gist1M_BKT_search_${TIME}.log
  #  -m 12 -k 400 -b 1
else
  echo "Usage: ./run.sh [dataset] [graph]"
  echo "e.g. ./run.sh sift kdt"
fi

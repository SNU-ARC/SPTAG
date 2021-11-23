#!/bin/sh

# Build Sift1M index
./indexbuilder -d 128 -v float -f XVEC -i ../datasets/sift1M/sift_base.fvecs -o sift1M_index_KDT -a KDT
./indexbuilder -d 128 -v float -f XVEC -i ../datasets/sift1M/sift_base.fvecs -o sift1M_index_BKT -a BKT

# Build Sift1M index
./indexbuilder -d 960 -v float -f XVEC -i ../datasets/gist1M/gist_base.fvecs -o gist1M_index_KDT -a KDT
./indexbuilder -d 960 -v float -f XVEC -i ../datasets/gist1M/gist_base.fvecs -o gist1M_index_BKT -a BKT

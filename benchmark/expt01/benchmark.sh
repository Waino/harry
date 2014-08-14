#!/bin/bash

datasets="enron hids nids reuters sentences sprot" # arts
measures="hamming levenshtein"
gcache="0 1"
nthreads="1 2 4 8"
runs="1 2 3"

export TIMEFORMAT="%R %U %S" 

for d in $datasets ; do
    for m in $measures ; do
        for n in $nthreads ; do
            for g in $gcache ; do
                for r in $runs ; do
                    printf "$d $m $n $g $r " 1>&2
                    time ../../src/harry -n $n -g $g -m $m -c ../$d.cfg \
                         ../$d.t*.gz /dev/null 
                done
            done
        done
    done
done

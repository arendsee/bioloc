#!/usr/bin/env bash

[ -d data ] || mkdir data
ln -sf /shared/class/bcb660/data/RNASeq/*fastq $PWD/data/

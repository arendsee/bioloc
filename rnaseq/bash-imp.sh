#!/usr/bin/env bash

library_typ=ft-unstranded
nthreads=8

# Input fastq list
fastqin='fastq-list.tab'
# Directory holding bowtie database
bowtiedb=bowtiedb
# BAM files produced by tophat
tophat_out=tophat_out.txt
# cufflinks GTF file outputs
cuffmerge_out=merged.gtf

# Produce plots to describe the input genome and help diagnose problems
genome_stats get_reference

bowtie2-build -o $bowtiedb get_reference

# TODO - install the fastq, all I am currently giving it is filenames
# TODO - make assertions about fastq files
while read line
do
    out=$(sed 's/.* //; s/_[12]\.fastq//')
    tophat                           \
        --library-type $library_type \
        -p $nthreads                 \
        -o $out                      \
        -g 2                         \
        $bowtiedb $line
    echo $out/accepted_hits.bam
done < $fastqin > $tophat_out

while read line
do
    out=${line%.*}
    cufflinks                        \
        --library-type $library_type \
        -p $ntreads                  \
        -o $out                      \
        -u                           \
        $line
    echo $out
done < $tophat_out > $cufflinks_out

cuffmerge -p $nthreads $cufflinks_out > $cuffmerge_out

cuffdiff                         \
    --library-type $library_type \
    -p $nthreads                 \
    -T                           \
    -u                           \
    -L flower,leaf               \
    $cuffmerge_out $(cat $tophat_out)

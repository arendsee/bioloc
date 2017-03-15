# Interval Size

## Source

The problem description (next section) is taken nearly verbatim from the BCB660
class taught by Andrew Severin at Iowa State University.

## Problem

You received some free sequencing data from a DNA facility that is testing out
their mate-pair library prep. In exchange they want to know how well they
prepared the library.  They have estimated the insert size to be 8000 bases.It
is your job to determine what the average insert size is based on alignment to
a reference genome. The data is from zea mays parviglumis. Find and download
a reference genome, align the reads and determine the average insert size.

Steps:

 1. Download Zea Maize from Ensembl or MaizeGDB

 2. Concatenate chromosomes if you need to into a single fasta file.

 3. Build Gmap database (`gmap_build`)

 4. Align raw data to GMAP database

 5. Determine and Qualify why you chose which output file to determine insert
    size  (use the split output option) 

 6. Use bash commands to determine the insert size.  Was the size what the
    genome sequencing facility estimated?  Was it over or under the estimated
    value?

```
cat *scr                                                   |
    grep AMELIA                                            |
    awk '{print $1,$3,$4}'                                 |
    paste - -                                              |
    awk '$1==$4'                                           |
    awk '($3>$6){print $1,$3-$6} ($3<$6) {print $1,$6-$3}' |
    /shared/software/bcb590/bin/createhist.awk 100         |
    sort -n                                                |
    awk '$2>50'
```

Questions

 1. Be sure to explain what the above command is doing and how it was used to
    determine insert size.

 2. What is the insert size?

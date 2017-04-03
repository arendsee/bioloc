## RNA-seq analysis

This analysis is taken directly from an RNA-seq tutorial offered by ENSEMBL.

https://www.ebi.ac.uk/training/online/course/ebi-next-generation-sequencing-practical-course/rna-sequencing/rna-seq-analysis-transcriptome

### Tools

TopHat --> Cufflinks
  

TopHat - aligns reads to a genome (based on Bowtie)
```
    TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns
    RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput
    short read aligner Bowtie, and then analyzes the mapping results to
    identify splice junctions between exons.
    - http://cole-trapnell-lab.github.io/projects/tophat/
```

 manual - http://ccb.jhu.edu/software/tophat/manual.shtml

Cufflinks
```
    Cufflinks assembles transcripts, estimates their abundances, and tests for
    differential expression and regulation in RNA-Seq samples. It accepts
    aligned RNA-Seq reads and assembles the alignments into a parsimonious set
    of transcripts. Cufflinks then estimates the relative abundances of these
    transcripts based on how many reads support each one, taking into account
    biases in library preparation protocols.
    - http://cole-trapnell-lab.github.io/cufflinks/
```

Cuffmerge

Cuffdiff

### Random notes

[Here](https://ugene.net/wiki/display/WDD/RNA-seq+Analysis+with+Tuxedo+Tools)



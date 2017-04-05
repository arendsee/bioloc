module load fastqc

out=fastqc-output
[[ -d $out ]] || mkdir $out
fastqc --outdir $out --threads 8 data/*fastq

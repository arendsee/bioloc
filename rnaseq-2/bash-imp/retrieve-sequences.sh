base=ftp://ftp.ensemblgenomes.org/pub/plants/release-34

[[ -d data ]] || mkdir data
cd data

if [[ ! -f Glycine_max.fa ]]
then
    wget $base/'fasta/glycine_max/dna/Glycine_max.V1.0.dna.chromosome.*.fa.gz'
    zcat *fa.gz > Glycine_max.fa
    rm *.fa.gz
fi

if [[ ! -f Glycine_max.gff3 ]]
then
    wget -O /dev/stdout $base/'gff3/glycine_max/Glycine_max.V1.0.34.gff3.gz' | gunzip > Glycine_max.gff3
fi

cd ..

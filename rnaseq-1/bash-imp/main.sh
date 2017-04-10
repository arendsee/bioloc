#!/usr/bin/bash

# ==================== S O U R C E ========================

runids () {
    echo -e "a\nb\nc"
}

retrieve () {
    echo $1 r
}

clean () {
    echo $1 c
}

genome_db () {
    echo g
}

align () {
    echo $1 $2 a
}

merge () {
    wc -l
}

quantify () {
    printf "nrow=%s\n" $(cat $1)
    cat $2 | sed 's/^/ > /'
}

map () {
    while read line
    do
        $@ $line
    done
}


# ==================== P A T H ========================

# runids                            |
#     map retrieve                  |
#     map clean                     |
#     map align $(genome_db) $fastq |
#     tee -a bam.txt                |
#     merge > transcriptome.gtf
#
# quantify transcriptome.gtf bam.txt > fpkm.txt



runids | map retrieve | map clean > clean.txt

map is_good < clean.txt | all
if [[ $? -ne 0 ]]; then
    echo "Bad output if function 'map clean'"
    exit 1
fi

cat clean.txt                 |
map align $(genome_db) $fastq |
tee -a bam.txt                |
merge > transcriptome.gtf

quantify transcriptome.gtf bam.txt > fpkm.txt

source config.sh

module load gsnap

gmap_build -D $gmapdb -d $species $genome

OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

touch $OUTPUT_FILE
for i in {1..9..2}; do
    for j in {1..6}; do
        for rep in `seq 1 5`; do
            echo "Size: $((i * 10**j))" >> $OUTPUT_FILE;
            ./src/parallelQuicksort $((i * 10**j)) >> $OUTPUT_FILE;
        done ;
    done ;
done


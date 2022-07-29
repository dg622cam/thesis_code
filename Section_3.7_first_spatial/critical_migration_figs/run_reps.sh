# run reps on finding spread of ancestry with different migration rates
mkdir tmp

for mig_per_gen in $(seq 1000 1000 15000) # can change this to for parameter in ...
do
    echo $mig_per_gen
    slim -s 314159 -d migrants_per_generation=$mig_per_gen generating_figs.slim > tmp/out_${mig_per_gen}.txt 

    line=`grep "avg ancestry" tmp/out_${mig_per_gen}.txt`
    ancestry=`echo $line | awk '{print $NF}'`
    echo $ancestry >> run_reps_out.txt
    rm tmp/out_${mig_per_gen}.txt
done

rm -r tmp

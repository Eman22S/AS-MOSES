# Example program using asmoses-bm.sh to benchmark a series of runs
# with some given options
#############
# Constants #
#############

# Run of times to repeat each run (as to gather statistics)
REPEAT=3

# Get the script directory
PRG_PATH="$(readlink -f "$0")"
PRG_DIR="$(dirname "$PRG_PATH")"

########
# Main #
########
echo "(INFO $(whoami) $(date) )" >> $PRG_DIR/asmoses-bench.log
echo "Run asmoses $REPEAT times on multiple problems of various complexity" >> $PRG_DIR/asmoses-bench.log
echo " " >> $PRG_DIR/asmoses-bench.log
echo "---------------------------------------------------------------------" >> $PRG_DIR/asmoses-bench.log
echo " " >> $PRG_DIR/asmoses-bench.log

for pbl in pa  mux; do
    for k in {3..5}; do
         $PRG_DIR/asmoses-bm.sh $PRG_DIR  $REPEAT -H$pbl -k$k -m2000 -p0.0001
	 $PRG_DIR/asmoses-bm.sh $PRG_DIR  $REPEAT -H$pbl -k$k -m2000 -p0.0001 --atomspace-port=1
	$PRG_DIR/asmoses-bm.sh $PRG_DIR  $REPEAT -H$pbl -k$k -m2000 -p0.0001 --atomspace-port=1 --atomspace-store=1
    done
done



echo "Run asmoses $REPEAT times on Melanoma and Cowles dataset " >> $PRG_DIR/asmoses-bench.log
echo " " >> $PRG_DIR/asmoses-bench.log                                                                   
echo "---------------------------------------------------------------------" >> $PRG_DIR/asmoses-bench.log 
echo " " >> $PRG_DIR/asmoses-bench.log
for file in datasets/*
do	
	$PRG_DIR/asmoses-bm.sh $PRG_DIR $REPEAT -i $file -m10000
	$PRG_DIR/asmoses-bm.sh $PRG_DIR $REPEAT -i $file -m10000 --atomspace-port=1
	$PRG_DIR/asmoses-bm.sh $PRG_DIR $REPEAT -i $file -m10000 --atomspace-port=1 --atomspace-store=1

done




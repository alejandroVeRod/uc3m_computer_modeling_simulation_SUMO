if [ $# -eq 3 ] 
then
for n in {1..30}
do
  duarouter -c conf/cruce.duarouter.cfg --route-files="$1" --net-file="$2" --seed $n --output-file="$3/cruce.$n.duarouter.xml"
done		

else
	echo "ERROR 3 parameters needed: ./simulation.sh <route file> <net file> <output folder>"
fi


if [ $# -eq 2 ] 
then
for n in {1..30}
do
  sumo -c conf/cruce.sumo.cfg --route-files="$1/cruce.$n.duarouter.xml" --seed $n --tripinfo="$2/cruce.$n.output.xml"
done		

else
	echo "ERROR 2 parameters needed: ./simulation.sh <route_name>.duarouter.xml <output_name>.output.xml"
fi


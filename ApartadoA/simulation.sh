if [ $# -eq 4 ] 
then

route_file=$1
net_file=$2
duarouter_path=$3
output_path=$4

for n in {1..30}
do
  duarouter -c conf/cruce.duarouter.cfg --route-files=$route_file --net-file=$net_file --seed $n --output-file="$duarouter_path/$n.duarouter.xml"
  sumo -c conf/cruce.sumo.cfg --net-file=$net_file --route-files="$duarouter_path/$n.duarouter.xml" --seed $n --tripinfo="$output_path/$n.output.xml"
done		

else
	echo "ERROR 4 parameters needed: ./simulation.sh </path/to/.route.xml file> </path/to/.net.xml file> </path/to/duarouter.xml folder> </path/to/output.xml folder>"
fi


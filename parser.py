import xmltodict
import os
import json

INPUT = "output/cruce.output.xml"
OUTPUT = "output/cruce.output.json"

xml_file = open(INPUT,'r')

json = json.dumps(xmltodict.parse(xml_file.read()))

json_file = open(OUTPUT,"w")

json_file.write(json)

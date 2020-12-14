import xmltodict
import os
import sys
import json

def read_xml(file_path):
    return xmltodict.parse(open(file_path).read())
def xmlTojson(file_path):
    return json.dumps(xmltodict.parse(open(file_path).read()))
def write_json(xml, file_path):
    json_data = json.dumps(xml)
    with open(file_path,"w") as json_file:
        json_file.write(json_data)

def main():
    if len(sys.argv) < 3:
        print("python3 xmltojson.py <input_path> <output_path>")
        exit()
    if not os.path.isfile(sys.argv[1]):
        print(sys.argv[1] + " is not a file")
        exit()
    xml_data = read_xml(sys.argv[1])
    write_json(xml_data, sys.argv[2])

if __name__ == "__main__":
    main()

import xml.dom.minidom
import os
import sys

def get_flows(dom):
  return dom.getElementsByTagName('flow')

def change_flows(flows):
  for flow in flows:
    number = flow.getAttribute('number')
    #Increases the traffic from west by two and 1.5 in the rest
    if str(flow.getAttribute('from')).startswith('s2'):
      flow.setAttribute('number',str(int(int(number) * 2)))
    else:
      flow.setAttribute('number',str(int(int(number) * 1.5)))

def write_xml(dom, file_path):
  with open(file_path, "w") as xml_file:
      dom.writexml(xml_file, encoding="utf-8")

def read_xml(file_path):
  return xml.dom.minidom.parse(open(file_path))




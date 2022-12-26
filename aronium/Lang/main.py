# import json
# import xmltodict
import xml.etree.ElementTree as ET
# from inspect import getmembers, isclass, isfunction

# with open("ku.lang") as xml_file:
#     data_dict = xmltodict.parse(xml_file.read())

lang = ET.parse('ku.lang')

root = lang.getroot()

text = root.get('code')

if __name__ == '__main__':
    print(text)
    # print(ET.tostring(root).decode(encoding='utf-8', errors='strict'))
    # for (name, member) in getmembers(ET, isclass):
    #     if not name.startswith('_'):
    #         print(name)

    # for (name, member) in getmembers(ET, isfunction):
    #     if not name.startswith('_'):
    #         print(name)

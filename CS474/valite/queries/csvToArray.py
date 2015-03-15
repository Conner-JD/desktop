import csv
import json
import gviz_api

csvfile = open('testcsv', 'r')
jsonfile = open('sample.json', 'w')

fieldnames = ('div_name','name','dropout_rate','per_capita')
reader = csv.DictReader( csvfile, fieldnames)
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')

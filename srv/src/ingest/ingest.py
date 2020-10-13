import argparse
import csv
import json
import googlemaps
from pprint import pprint
from urllib.parse import quote_plus
from pymongo import MongoClient

gmaps = googlemaps.Client('AIzaSyDYSUgA7HQOoPpzcgmrZBzcACfsfUryEso')

mongo_client = MongoClient('localhost',
                           username='ingest',
                           password='fPyRA2yT2vIfVvBWBQMhUnnmrqBO1nwK',
                           authSource='green_berlin')

db = mongo_client['green_berlin']
companies = db.companies

with open('companies.csv', 'r') as f:
    csvreader = csv.DictReader(f)
    for row in csvreader:
        try:
            addr = '{} {}, {} {}'.format(row['addr_street'],
                                         row['addr_street_number'],
                                         row['addr_zip_code'],
                                         row['addr_city'])
            geocode_result = gmaps.geocode(addr)
            row['latitude'] = geocode_result[0]['geometry']['location']['lat']
            row['longitude'] = geocode_result[0]['geometry']['location']['lng']
            companies.insert_one(row)
            print('Inserted {}'.format(addr))
        except Exception as e:
            pprint(e)

from pprint import pprint
from typing import Optional
from fastapi import FastAPI
from pymongo import MongoClient

mongo_client = MongoClient('localhost',
                           username='api',
                           password='yj7ZafiDPUN27QacNcHkLwBxgCpWV0GN',
                           authSource='green_berlin')
mongo_db = mongo_client['green_berlin']
mongo_collection_companies = mongo_db['companies']

app = FastAPI()

@app.get('/api/')
def get_root():
    return {'Hello': 'World'}

@app.get('/api/companies/all')
def get_companies_all():
    companies = list(mongo_collection_companies.find())
    return [{
        'company_name': company['company_name'],
        'comment': company['comment'],
        'company_category': company['company_category'],
        'addr_street': company['addr_street'],
        'addr_extra': company['addr_extra'],
        'addr_street_number': company['addr_street_number'],
        'addr_zip_code': company['addr_zip_code'],
        'addr_city': company['addr_city'],
        'contact_email': company['contact_email'],
        'contact_phone': company['contact_phone'],
        'contact_person': company['contact_person'],
        'contact_website': company['contact_website'],
        'opening_hours': company['opening_hours'],
        'latitude': company['latitude'],
        'longitude': company['longitude'],
    } for company in companies]
   

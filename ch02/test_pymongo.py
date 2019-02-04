from pymongo import MongoClient
client = MongoClient()
db = client.agile_data_science
res = list(db.executives.find({"name": "Russell Jurney"}))
print(res)

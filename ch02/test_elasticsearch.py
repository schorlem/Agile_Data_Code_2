from pyelasticsearch import ElasticSearch
es = ElasticSearch('http://localhost:9200/')
output = es.search('name:Russell', index='agile_data_science')
print(output)


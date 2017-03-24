import urllib.request

doi = []
count = 0
with open('doi.txt', 'r', encoding='utf-8') as doi_file :
	lines = doi_file.readlines()
	for line in lines :
		line = line.split(" ")
		doi.append(line[2])

print (len(doi))
for item in set(doi) :
	url = 'http://sci-hub.cc/' + item
	if urllib.request.urlretrieve(url, 'files/'+item.replace("/", "_")+'.pdf'):
		continue
	else:
		count+1

print (count + ' dos '+ len(set(doi)) +' artigos nao foram baixados')
	# print (url)

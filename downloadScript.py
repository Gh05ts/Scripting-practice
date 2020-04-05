import urllib.request as ul

print('Beginning download')

url = 'https://'

for i in range(1, 494):
    ul.urlretrieve(url + str(i) + '.jpg', './folder/i.jpg')
    
print('fin')

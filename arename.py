from os import rename, listdir

fnames = listdir('.')

for fname in fnames:
	rename(fname, 'a' + fname)

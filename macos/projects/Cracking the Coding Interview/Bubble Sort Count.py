n = int(raw_input().strip())
a = map(int, raw_input().strip().split(' '))

numSwaps = 0
i = 0
while i < n:
	numInSwaps = 0
	j = 0
	while j < n - 1:
		if a[j] > a[j+1]:
			# swap things
			t, s = a[j], a[j+1]
			a[j], a[j+1] = s, t
			numInSwaps += 1
			numSwaps += 1
		j += 1

	if numInSwaps == 0:
		break

print "Array is sorted in " + str(numSwaps) + " swaps."
print "First Element: %d" % a[0]
print "Last Element: %d" % a[n-1]

def readArray():
	n, k = map(int, raw_input().strip().split(' '))
	a = map(int, raw_input().strip().split(' '))

	# For efficiency, lets do the least number of rotations needed
	# e.g. rotating a list of 3 elements 4 times is the same as
	# rotating the list 1 time
	k = k % len(a)

	return (a, k)

def rotLeft(array, numShifts):
	temp = array[numShifts:] + array[:numShifts]
	return temp

(arr, rots) = readArray()
arr = rotLeft(arr, rots)
print ' '.join(map(str,arr))

#include <stdio.h>
#include <math.h>

// Return true if the number is prime
int isprime(int n)
{
	// This funtion does weird things for small values, so I'm going to 
	// handle them seperatly
	int smallPrimes[6] == {2, 3, 5, 7, 11, 13};
	if (n < 16)
	{
		for (int i = 0; i < 6; ++i)
		{
			if (smallPrimes[i] == n)
			{
				return 1;
			}
		}
	}

	// For all other numbers, we'll just do the old fashioned loop
	for (int i = 3; i < ceil(sqrt(n)); i+=2)
	{
		if (n % i == 0)
		{
			return 1;
		}
	}
	return 0;
}

// Find the smallest multiple of all numbers from 1 to n (inclusive)
int samllestMul(int n)
{
	// Start with 1, since it divides 1
	int retval = 1;

	// Algorithm Breakdown (break it down)
	// 
	// For each prime number less than or equal to n, multiply the 
	// return value by the greatest power of that number less than
	// or equal to n
	// 
	// e.g. smallestMul(10) = 1 * 2^3 * 3^2 * 5^1 * 7^1		<--- Primes <= 10
	// 						= 1 *  8  *  9  *  5  *  7		<--- Still <= 10
	// 						= 2520
	for(int i = 2; i <= n; ++i)
	{
		if (isprime(i))
		{
			for (int j = 1; j < 100; ++j)
			{
				// Find the first power such that the prime to the power
				// is greater than n
				if (pow(i, j) > n)
				{
					// and use the (power-1) since that is guarenteed
					// to be less than or equal to n
					retval *= pow(i, j-1);
					break;
				}
			}
		}
	}
	return retval;
}

int main(int argc, char const *argv[])
{
	printf("%d\n", samllestMul(20));
	return 0;
}


// ANOTHER SOLUTION
// Assume primes[i] has been initialized
// n is the input, as above
// k is the returned value
// i is the loop index
// a[] is an array of the powers of each prime

/*
n = 20
k = 1
i = 1

check = true
limit = sqrt(k)

while(primes[i] <= n) // Walk through the primes less than n
	a[i] = 1
	if check == true
		if p[i] <= limit
			a[i] = floor( log(k) / log(p[i]) ) // Natural log
		else
			check = false

	k = k * pow( primes[i], a[i] )
	i++

print k
*/

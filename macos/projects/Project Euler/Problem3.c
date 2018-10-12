#include <stdio.h>
#include <math.h>

// Return non-0 if the number is prime
long long isPrime(long long n)
{
	for(long long i = 3; i < sqrt(n); i+=2)
	{
		if (n % i == 0)
		{
			return 0;
		}
	}
	return 1;
}

// Find largest prime factor
long long largestPrimeFactor(long long n)
{
	long long largest;
	for(long long i = 2; i < sqrt(n); i++)
	{
		// If it's a factor of n
		if (n % i == 0)
		{
			// If it's prime
			if (isPrime(i))
			{
				// Set it to largest so far
				largest = i;
			}
		}
	}
	return largest;
}

int main(int argc, char const *argv[])
{
	printf("%lld\n", largestPrimeFactor(3028194581342712039));
	return 0;
}

#include <stdio.h>
#include <math.h>

// Returns (sum(1, n))^2
// e.g. (1 + 2 + 3...)^2
int squareSums(int n)
{
	return pow(((n) * (n+1))/2, 2);
}

// Sum of the squares from n to m
// e.g. 1^2 + 2^2 + 3^2, etc.
int sumSquares(int n, int m)
{
	int sum = 0;
	for(int i = n; i <= m; i++)
	{
		sum += pow(i, 2);
	}
	printf("%d\n", sum);
	return sum;
}

int main(int argc, char const *argv[])
{
	int x = sumSquares(1, 100);
	int y = squareSums(100);
	printf("%d - %d = %d\n", y, x, y-x);
	return 0;
}


// OPTIMAL SOLUTION
/*
int main(int argc, char const *argv[])
{
	sum_sq = pow((n) * (n+1) / 2, 2);
	sq_sum = (2 * n + 1) * (n + 1) * n / 6; // See pdf on projecteuler.net for proof
	printf("%d - %d = %d\n", sum_sq, sq_sum, sum_sq - sq_sum)l
	return 0;
}
*/

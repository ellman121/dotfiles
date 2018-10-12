#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

int isPalindrome(int n)
{
	// Convert the number to a string
	char temp[80];
	sprintf(temp, "%d", n);

	// Is the string a palindrome?
	int i = 0;
	int j = strlen(temp) - 1; // Yes, I know I could get this when I call sprintf

	while(i < j)
	{
		if(temp[i] != temp[j])
		{
			return 0;
		}
		i++;
		j--;
	}
	return 1;
}

int main(int argc, char const *argv[])
{
	char *temp;

	return 0;
}


// ANOTHER SOLUTION

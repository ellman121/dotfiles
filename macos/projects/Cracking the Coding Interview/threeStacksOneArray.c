// Three in One
//
// C Program to implement three stacks using 1 array
//
// Reads in formatted data as pairs of integers.  The first
// integer is the stack to push onto, the second number is
// the number to push.  An input of -1 ends the program.
// See example input file.  

#include <stdio.h>

// Our "stacks"
int stacks[3072];
int stackOneIndex;
int stackTwoIndex;
int stackThreeIndex;

// Push onto the selected stack
void push(int stackToPushOnto, int numberToPush)
{
	switch (stackToPushOnto)
	{
		case 1:
		stacks[stackOneIndex] = numberToPush;
		stackOneIndex += 3;
		break;

		case 2:
		stacks[stackTwoIndex] = numberToPush;
		stackTwoIndex += 3;
		break;

		case 3:
		stacks[stackThreeIndex] = numberToPush;
		stackThreeIndex += 3;
		break;
	}
}

int main(int argc, char const *argv[])
{
	// Local variables
	int stackChoice;
	int number;

	// Initialize things
	stackOneIndex = 0;
	stackTwoIndex = 1;
	stackThreeIndex = 2;

	// Menu Based Programs!
	while(1)
	{
		// Read in stack choice
		scanf("%d", &stackChoice);

		// If it's -1, quit
		if(stackChoice == -1)
			break;

		// Read in the number to insert
		scanf("%d", &number);

		push(stackChoice, number);
	}

	// Print out our stacks
	printf("Stack 1:");
	for(int i = 0; i < stackOneIndex; i += 3)
	{
		printf(" %d", stacks[i]);
	}
	printf("\n");

	printf("Stack 2:");
	for(int i = 1; i < stackTwoIndex; i += 3)
	{
		printf(" %d", stacks[i]);
	}
	printf("\n");

	printf("Stack 3:");
	for(int i = 2; i < stackThreeIndex; i += 3)
	{
		printf(" %d", stacks[i]);
	}
	printf("\n");

	return 0;
}

#include <stdlib.h>
#include <stdio.h>

typedef struct linkedList
{
	int num;
	void *next;
} linkedList_t;

linkedList_t *fibsUpTo(int n)
{
	int temp;
	int previous = 1;
	int current = 2;

	linkedList_t *head = malloc(sizeof(linkedList_t));
	linkedList_t *node = malloc(sizeof(linkedList_t));

	head->num = 1;
	head->next = node;

	while(1==1)
	{
		// Set current node in linked list
		node->num = current;

		// Increase fib numbers
		temp = previous;
		previous = current;
		current += temp;

		// If current is less than n, allocate a new node, assign it,
		// and move forward
		if (current < n)
		{
			linkedList_t *new = malloc(sizeof(linkedList_t));
			node->next = new;
			node = node->next;
		}
		else
		{
			node->next = NULL;
			break;
		}
	}

	return head;
}

int main(int argc, char const *argv[])
{
	int sum = 0;

	linkedList_t *fibs = fibsUpTo(4000000);

	while(1==1)
	{
		if (fibs->num % 2 == 0)
		{
			sum += fibs->num;
		}
		fibs = fibs->next;

		if (fibs == NULL)
		{
			break;
		}
	}

	printf("%d\n", sum);

	return 0;
}

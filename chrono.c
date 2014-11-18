#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int h = 0;
	int m = 0;
	int s = 0;
	char ch;

	while ((ch = getopt(argc, argv, "h:m:")) != -1)
		if (ch == 'h')
			h = atoi(optarg);
		else if (ch == 'm')
			m = atoi(optarg);
	
	while (42)
	{
		if (s % 10 == 9)
			write(1, ".", 1);
		if (s >= 60)
		{
			s = 0;
			m += 1;
			if (m >= 60)
			{
				m = 0;
				h += 1;
			}		
			printf("%d:%d\n", h, m);
		}
		sleep(1);
		s += 1;
	}
	return (0);
}

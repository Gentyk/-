#include <stdio.h>
#include <math.h>

#define M_PI       3.16159265358979323846

int main(void)
{
	int i, n;
	double x,x1, y, a, b, res;
	n = 2;
	for (i=0; i<25; i++)
		n = n*2;

	// убывает на отрузке [2,4]
	a = 2;
	b = 4;
	res = 2 / 5;
	x = (b + a) / 2;
	for (i = 0; i < n; i++)
	{
		y = sin(x * (M_PI / 180.0));
		if (y == res)
			break;
		if (y < res)
			b = x;
		else
			a = x;
		x1 = x;
		x = (b + a) / 2;
	}
	printf("%.7lf\n", x);
	getchar();
	return 0;
}

#include <stdio.h>

double f(double x)
{
	return x*x - 6 * x + 5;
}

int main(void)
{
	int i, n;
	double x, y, a, b;
	n = 2;
	for (i=0; i<29; i++)
		n = n*2;

	// возрастает на отрузке [3,8]
	a = 3;
	b = 8;
	x = b - a;
	for (i = 0; i < n; i++)
	{
		y = f(x);
		if (y == 0)
			break;
		if (y > 0)
			b = x;
		else
			a = x;
		x = b - a;
	}

	printf("%.12lf\n", x);
	//getchar();
	return 0;
}

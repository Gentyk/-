// ConsoleApplication7.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <string>
#include <iostream>

using namespace std;


int main()
{
	int a;
	int i;
	int summ;
	summ = 0;
	cin >> a;

	for (i = 0 ; i <= a; i++)
	{
		//cout << i << endl;
		if (i % 2 == 0)
		{
			summ = summ + i;
		}
	}
	cout << summ << endl;
    return 0;
}

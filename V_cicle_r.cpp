// ConsoleApplication5.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <string>
#include <iostream>

using namespace std;




int main()
{
	int a;
	int result;
	cin >> a;
   
	if (a%2==0)
	{
		result = a*a;
		cout << result << endl;

	

	}
	else  
	{
		cout << a << endl;
	}
}


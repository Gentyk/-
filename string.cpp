#include <stdio.h>
#include <string>
#include <iostream>
using namespace std;


int main()
{
	
	string s;
	cin>>s;
	
	cout<< s<<"\n";

	int N = s.length();
	for (int i = N - 1; i >= 0; i--)
		printf("%c", s[i]);
	cout << "\n";
	for (int i = N - 1; i >= 0; i--)
		printf("%d,", (int)s[i]);	

	//printf("dfd");
	//getchar();
	cin >> s;
}

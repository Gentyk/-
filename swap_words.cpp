//смена местами самого длинного слова и самого короткого влоб

#include <stdio.h>
#include <string>
#include <iostream>

using namespace std;


int main()
{
	string s;
	getline(cin, s);
	int N, max, min, j, i, k, len;
	int max_index[2], min_index[2];
	N = s.length();
	i = 0;
	min = N;
	max = -1;
	while (i < N)
	{		
		if (((i > 0) && (s[i-1] == ' ') && (s[i] != ' ')) || i == 0 && s[i] != ' ')
		{
			j = i + 1;
			while (j < N && s[j] != ' ')
				j++;
			len = j - i;
			if (max < len)
			{
				max = len;
				max_index[0] = i;
				max_index[1] = j;
			}
			
			if (min > len)
			{
				min = len;
				min_index[0] = i;
				min_index[1] = j;
			}
			i = j-1;
		}
		i++;
	}

	string new_str = "";
	if (min_index[0] < max_index[0])
	{
		for (i = 0; i < min_index[0]; i++)
			new_str += s[i];
		for (i = max_index[0]; i < max_index[1]; i++)
			new_str += s[i];
		for (i = min_index[1]; i<max_index[0]; i++)
			new_str += s[i];
		for (i = min_index[0]; i<min_index[1]; i++)
			new_str += s[i];
		for (i = max_index[1]; i<N; i++)
			new_str += s[i];
	}
	else
	{
		for (i = 0; i < max_index[0]; i++)
			new_str += s[i];
		for (i = min_index[0]; i < min_index[1]; i++)
			new_str += s[i];
		for (i = max_index[1]; i<min_index[0]; i++)
			new_str += s[i];
		for (i = max_index[0]; i<max_index[1]; i++)
			new_str += s[i];
		for (i = min_index[1]; i<N; i++)
			new_str += s[i];
	}

	cout << new_str;
	system("pause");
}

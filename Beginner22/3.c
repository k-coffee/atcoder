#include <stdio.h>

#define MAX 1000000

int main(void) {
	int n, m, u, v, l, i, j, k;
	int tmp;
	int mymap[300][300];

	int ans = MAX;

	scanf("%d %d", &n, &m);

	for (i = 0; i < n; i++)
		for (j = 0; j < n; j++)
			mymap[i][j] = MAX;

	for (i = 0; i < m; i++) {
		scanf("%d %d %d", &u, &v, &l);
		mymap[u-1][v-1] = l;
		mymap[v-1][u-1] = l;
	}

	for (i = 0; i < n; i++)
		mymap[i][i] = 0;

	for (k = 1; k < n; k++)
		for (i = 1; i < n; i++)
			for (j = 1; j < n; j++)
				if (mymap[i][j] > (mymap[i][k] + mymap[j][k]))
					mymap[i][j] = mymap[i][k] + mymap[j][k];

	for (i = 1; i < n; i++) {
		if (mymap[0][i] == MAX)
			continue;

		for (j = i+1; j < n; j++) {
			if (mymap[0][j] == MAX)
				continue;
			tmp = mymap[i][j] + mymap[0][i] + mymap[0][j];
			if (ans > tmp)
				ans = tmp;
		}
	}

	if (ans >= MAX)
		printf("-1\n");
	else
		printf("%d\n", ans);

	return 0;
}

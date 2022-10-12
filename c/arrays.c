#include <stdio.h>

int main()
{
    int i, c;
    int ndigit[10];

    for (i=0; i<10; i++)
        ndigit[i] = 0;

    while((c = getchar()) != EOF){
        if (c >= '0' && c <= '9')
            ++ndigit[c - '0'];
    }

    for (i = 0; i<10; i++)
        printf("%d", ndigit[i]);

    return 0;
}

#include <stdio.h>

char *get_digits(int ndigit[10])
{
    int i, c;

    for (i=0; i<10; i++)
        ndigit[i] = 0;

    while((c = getchar()) != EOF){
        if (c >= '0' && c <= '9')
            ++ndigit[c - '0'];
    }

    return (char *) ndigit;
}

int main()
{

    int i;
    int ndigit[10];

    char  *result = get_digits(ndigit);
    for (i = 0; i<10; i++)
        printf("%d", result[i]);

    return 0;
}

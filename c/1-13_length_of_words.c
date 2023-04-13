#include <stdio.h>

#define IN 1
#define OUT 0

#define MAX_WORDS 15

void main() {
    int c, i, status;
    int words[MAX_WORDS];
    i = 0;
    status = OUT;

    for (int j = 0; j < MAX_WORDS; j++) {
        words[j] = 0;
    }

    while ((c = getchar()) != EOF) {
        if (c >= 'a' && c <= 'z' && status == OUT) {
            putchar(c);
            status = IN;
            ++words[i];
        } else if (c >= 'a' && c <= 'z' && status == IN) {
            putchar(c);
            ++words[i];
        } else if (c == ' ' || c == '\t' || c == '\n') {
            status = OUT;
            ++i;
        } else if (c == '0') {
            break;
        }
    }
    printf("\nLengths of words: \n");
    for (int i = 0; i < MAX_WORDS; ++i) {
        printf(" %d ", words[i]);
    }

    // Histogram presentation of the same
    for (int i = 0; i < MAX_WORDS; i++) {
        printf("\n");
        for (int j = 0; j < words[i]; j++) {
            printf(" X ");
        }
    }
}

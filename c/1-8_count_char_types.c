#include <stdio.h>

/* Counts blanks, tabs and newlines */

void main() {
    int c;
    int blank = 0;
    int tab = 0;
    int nl = 0;

    while ((c = getchar()) != EOF) {
        putchar(c);

        if (c == '\n') ++nl;

        if (c == '\t') ++tab;

        if (c == ' ') ++blank;

        if (c == '0') break;
    }

    printf("\nBlanks: %d, tabs: %d, newlines: %d \n", blank, tab, nl);
}

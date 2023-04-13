#include <stdio.h>

/* Write only one word per line. */

void main() {
    int c;

    while ((c = getchar()) != EOF) {
        if (c >= 'a' && c <= 'z') {
            putchar(c);
        } else if (c >= 'A' && c <= 'Z') {
            putchar(c);
        } else if (c == ' ' || c == '\t') {
            putchar('\n');
        } else if (c == '0') {
            break;
        } else {
            putchar(c);
        }
    }
}

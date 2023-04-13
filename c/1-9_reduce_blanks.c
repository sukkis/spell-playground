#include <stdio.h>

/* Copy input to output but reduce blanks to 1 if there is several. */

void main() {
    int c;
    int blanks = 0;

    while ((c = getchar()) != EOF) {
        if (c == ' ' && (blanks == 0)) {
            putchar(c);
            ++blanks;
        } else if (c == ' ' && blanks == 1) {
            ;
        } else if (c == '0') {
            break;
        } else {
            putchar(c);
            blanks = 0;
        }
    }
}

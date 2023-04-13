#include <stdio.h>

/* Count words, lines and characters.
   Not tested for: handling numbers,
   extended alphabets e.g. "å, ä, ö",
   special characters like \t.
   In other words, only the happy path
   works.
 */

#define IN 1
#define OUT 0

void main() {
    int c, status;
    long lines, words, characters;
    lines = words = characters = 0;

    status = OUT;

    while ((c = getchar()) != EOF) {
        if (c >= 'a' && c <= 'z') {
            if (status == IN) {
                ++characters;
            } else if (status == OUT) {
                ++characters;
                ++words;
                status = IN;
            }
        } else if (c == ' ') {
            status = OUT;
        } else if (c == '\n') {
            status = OUT;
            ++lines;
        } else {
            break;
        }
    }
    printf("\n\nChars: %ld Lines: %ld Words: %ld\n", characters, lines, words);
}

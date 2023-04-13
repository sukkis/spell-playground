#include <stdio.h>

#define LOWER -40
#define UPPER 200
#define STEP 20

/*  Temperature table with a header */

float fahr_to_celsius(float fahr) { return ((5.0 / 9.0) * (fahr - 32.0)); }

void header() {
    printf("Temperature table\n");
    printf("*****************\n\n");
    printf("Fahrenheit    Celcius\n");
    printf("---------------------\n\n");
}

void main() {
    float fahr, celsius;

    header();

    for (fahr = LOWER; fahr < UPPER; fahr = fahr + STEP) {
        printf("%10.2f    %6.2f \n", fahr, fahr_to_celsius(fahr));
    }
}

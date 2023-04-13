#include <stdio.h>

#define LOWER -100
#define UPPER 100
#define STEP 10

float cel_to_fahr(float celsius) {
    // celsius = (5.0/9.0) * (fahr-32.0)
    // fahr    = celsius * (9.0 / 5.0) + 32
    return (celsius * (9.0 / 5.0) + 32);
}

void main() {
    float cel;
    printf("Celsius    Fahrenheit\n");
    for (cel = LOWER; cel <= UPPER; cel = cel + STEP) {
        printf("%7.2f    %6.2f \n", cel, cel_to_fahr(cel));
    }
}

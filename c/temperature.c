#include <stdio.h>
#include <stdlib.h>

/*
  Formula: c = (5/9)*(f-32)
*/

float fahrenheit_to_celsius(int fahrenheit)
{
        return (5.0/9.0)*(fahrenheit-32);
}

float celsius_to_fahrenheit(int celsius)
{
        return (celsius * (9.0/5.0) + 32);
}

int temperature_chart(){
        int fahr, step, min, max;
        min = -60;  //degrees fahrenheit
        max = 300;
        step = 20;

        printf("%6s %s", "F", "C");

        for (fahr = min; fahr <= max; fahr += step){
                printf("%6.1d %.1f\n", fahr, fahrenheit_to_celsius(fahr));
        }
        return 0;
}

int main()
{
        int n, f, c;

        printf("Press number to choose a temperature conversion. \n");
        printf("0 - fahrenheit to celsius: ");
        printf("1 - celsius to fahrenheit: ");
        printf("2 - temperature chart: ");
        scanf("%d", &n);

        if (n == 0){
                printf("Give temperature in fahrenheit: ");
                scanf("%d", &f);
                printf("%6.1d fahrenheit is %.1f degrees celsius.\n", f, fahrenheit_to_celsius(f));
        }
        else if (n == 1) {
                printf("Give temperature in celsius: ");
                scanf("%d", &c);
                printf("%6.1d celcius is %.1f degrees fahrenheit.\n", c, celsius_to_fahrenheit(c));
        }
        else if (n == 2) {
                temperature_chart();
        }
        else {
                exit(0);
        }

        return 0;
}

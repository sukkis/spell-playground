#include <stdio.h>
#include <string.h>

// Passes back all the command line arguments given.


char* clean_name(char *str)
{
     int n = 3;

     if (strncmp(str, "./", n)){
	  str = &str[2];
     }

     return str;
}

int main(int argc, char *argv[])
{
     printf("Number of arguments passed: %4d \n", argc);

     if (argc >= 1) {
	  printf("Name of program and %d other arguments. \n", argc -1);
     } else {
	  printf("Something went wrong in calling the program.");
     }

     printf("Name of the program is: %s \n",clean_name(argv[0]));

     int i;

     for (i = 1; i < argc; i++){
	  printf("Argument %d is %s \n", i, argv[i]);
     }

     return 0;
}

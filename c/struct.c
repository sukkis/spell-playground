#include <stdio.h>
#include <string.h>

#define MAX_PEOPLE 4

struct person {
    char name[30];
    char known_for[30];
    char country[30];
    char born[20];
    char died[20];
} people[MAX_PEOPLE];


int populate(){
    strcpy(people[0].name, "Elisabeth C. Stanton");
    strcpy(people[0].known_for, "Women's rights");
    strcpy(people[0].country, "USA");
    strcpy(people[0].born, "Nov 1815");
    strcpy(people[0].died, "Oct 1902");

    strcpy(people[1].name, "Martin Luther");
    strcpy(people[1].known_for, "The Reformation");
    strcpy(people[1].country, "Germany");
    strcpy(people[1].born, "Nov 1483");
    strcpy(people[1].died, "Feb 1546");

    strcpy(people[2].name, "Galileo Galilei");
    strcpy(people[2].known_for, "Physics");
    strcpy(people[2].country, "Italy");
    strcpy(people[2].born, "Feb 1564");
    strcpy(people[2].died, "Jan 1642");

    strcpy(people[3].name, "Johannes Gutenberg");
    strcpy(people[3].known_for, "Modern printing press");
    strcpy(people[3].country, "Germany");
    strcpy(people[3].born, "Jan 1400");
    strcpy(people[3].died, "Feb 1462");



    return 0;
}


int main(){
    populate();
    printf("Name    Known for    Country    Born    Died\n");
    printf("********************************************\n");

    for (int n = 0; n < MAX_PEOPLE; n++){
	printf("%s, %s, %s, %s, %s \n", people[n].name, people[n].known_for, people[n].country, people[n].born, people[n].died);
    }

    // With sorting
    printf("\n\n");
    printf("Name    Known for    Country    Born    Died\n");
    printf("********************************************\n");
    for (int n = 3; n >= 0; n--){
	printf("%s, %s, %s, %s, %s \n", people[n].name, people[n].known_for, people[n].country, people[n].born, people[n].died);
    }
}

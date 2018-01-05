#include <stdio.h>

int main() {

    int i = 0;
    int j = 0;
    
    for (i = 0; i < 11; i = i + 1) {
        for (j = 0; j < 11; j = j + 1) {
            int p = i * j;
            printf("%d", p);
            printf(" ");
        }
        printf("\n");
    }
}
#include <stdio.h>

int main() {

    int a = 1;
    int b = 1;
    int c;

    int t = 0;

    while (t < 10) {
        c = a + b;
        a = b;
        b = c;
        printf("%d ", c);

        t = t + 1;  
    }

    printf("\n");
}
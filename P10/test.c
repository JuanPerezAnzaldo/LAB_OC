#include <stdio.h>

extern int Suma(int a, int b);
extern int Strlen(char *str);
extern int GetBit( int value, int numbit);

int main()
{
    int a = 5, b = 10;
    char cadena[5] = "Hola";
    printf("La suma de %d + %d es: %d\n", a, b, Suma(a,b));
    printf("La cadena tiene longitud de: %d\n", Strlen(cadena)));

    return 0;
}

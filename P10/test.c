#include <stdio.h>

extern int Suma(int a, int b);
extern int Strlen(char *str);
extern int GetBit( int value, int numbit);

int main()
{
    int a = 5, b = 10, val = 10, num = 3;
    char cadena[5] = "Juan";
    
    printf("La suma de %d + %d es: %d\n", a, b, Suma(a,b));

    printf("La cadena %s tiene longitud de: %d\n", cadena, Strlen(cadena));

    printf("El estado del bit %d del numero %d es: %d\n", num, val, GetBit(val,num));
    return 0;
}
#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato8);
extern void pBin16b(uint16_t);
extern void pBin32b(uint32_t);
extern void pBin64b(uint64_t);

int main() 
{
    uint8_t dato8 = 0xAA; 
    printf("Dato de 8 bits : ");
    pBin8b(dato8);
    printf("\n");

    uint16_t dato16 = 0xAAAA; 
    printf("Dato de 16 bits: ");
    pBin16b(dato16);
    printf("\n");

    uint32_t dato32 = 0xAAAAAAAA;
    printf("Dato de 32 bits: ");
    pBin32b(dato32);
    printf("\n");
 
    uint64_t dato64 = 0xAAAAAAAAAAAAAAAA; 
    printf("Dato de 64 bits : ");
    pBin64b(dato64);

    return 0;
}
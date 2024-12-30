
#include <stdio.h>


//extern "C" void __stdcall asmfunc(void);

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int p1 ,int p2);

#ifdef __cplusplus
}
#endif


int main() {
   
    int array[] = {-6, -3, -1, -10, 10, 30, 40, 4};  
    int arraySize = sizeof(array) / sizeof(array[0]); // Number of elements in the array
    int sumEven = 0; 
    int sumOdd = 0;  

   
    for (int i = 0; i < arraySize; i++) {
        if (array[i] % 2 == 0) {  
            sumEven += array[i];
        } else { 
            sumOdd += array[i];
        }
    }

    // Display the results
    printf("Sum of even values: %d\n", sumEven);
    printf("Sum of odd values: %d\n", sumOdd);
    printf("Assembly procedure ended now.\n");

    return 0;
}

#include <stdio.h>
int main(){
    int array[5] = {1, 2, 3, 4, 5};
    int arr_length = sizeof(array) / sizeof(array[0]);
    printf("array : ");
    for (int i=0; i<arr_length; i++){
        printf("%d ", array[i]);
    }
    array[3] = 20;//insert 20 to array[3]
    array[2] = 10;//insert 10 to array[2] 
    printf("\narray : ");
    for (int i=0; i<arr_length; i++){
        printf("%d ", array[i]);
    }
    return 0;
}

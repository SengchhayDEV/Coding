#include <stdio.h>
int main(){
    int finish_time[5] = {25, 19, 40, 18, 35};
    int f_time = sizeof(finish_time) / sizeof(finish_time[0]);
    printf("The finishtime of the Marathon runner : ");
    int i, x;
    for (i=0; i < f_time; i++){
        printf("%d ", finish_time[i]);
        }
    for (i=0; i < f_time; i++){
        for (x=0; x < f_time; x++){
            if (finish_time[x]>finish_time[i]){
                int temp;
                temp = finish_time[i];
                finish_time[i] = finish_time[x];
                finish_time[x] = temp;
            }
        }
    }
    printf("\nthe order of the winner : ");
    for (int i=0; i<f_time; i++){
        printf("%d ", finish_time[i]);
    }
}

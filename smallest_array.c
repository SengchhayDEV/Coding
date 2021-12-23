#include <stdio.h>
int main(){
    int i, min;
    int finish_time[5] = {25, 19, 40, 18, 35};
    int f_time = sizeof(finish_time) / sizeof(finish_time[0]);
    printf("The finishtime of the Marathon runner : ");
    for (i=0; i < f_time; i++){
        printf("%d ", finish_time[i]);
        if(min>finish_time[i]){
            min=finish_time[i];
        }
    }
    printf("\nThe First winner of the marathon use %ds in the game", min);
}

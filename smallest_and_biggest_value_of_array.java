import java.util.Scanner;
import java.util.Arrays;

class smallest_and_biggest_value_of_array {
    public static void main(String args[]) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter the number of Array : ");
        int first, next;
        int n = scan.nextInt();// get input from user for array length
        int arr[] = new int[n]; // declaring an array of n elements

        // for loop takes input from user
        for (int i = 0; i < n; i++) {
            System.out.print("Array " + (i + 1) + " Value is : ");
            arr[i] = scan.nextInt();// takes input from user for array
        }
        Arrays.sort(arr);
        first = arr[0];// assume first element as smallest value
        next = arr[0];// assume first element as biggest value
        for (int i = 0; i < n; i++) {
            if (first > arr[i]) {
                first = arr[i];
            }

            if (next < arr[i]) {
                next = arr[i];
            }
        }
        System.out.print("\nThe smallest number is: " + first);
        System.out.print("\nThe biggest number is: " + next);
    }
}

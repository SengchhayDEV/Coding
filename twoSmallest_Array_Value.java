class twoSmallest_Array_Value {

    static void Timing(int arr[]) {
        int first, second, arr_size = arr.length;

        /* There should be atleast two elements */
        if (arr_size < 2) {
            System.out.println("");
            return;
        }

        first = second = Integer.MAX_VALUE;
        for (int i = 0; i < arr_size; i++) {
            System.out.println("The Marathon Runner #" + (i + 1) + " Reach the Finish line in: " + arr[i] + "s");

            if (arr[i] < first) {
                second = first;
                first = arr[i];
            }

            else if (arr[i] < second && arr[i] != first)
                second = arr[i];
        }
        if (second == Integer.MAX_VALUE)
            System.out.println("");
        else
            System.out.println("The Best Performer is " + first + "s" + "\nThe second Winner is " + second + "s");
    }

    public static void main(String[] args) {
        int arr[] = { 600, 540, 580, 590, 545, 565 };
        Timing(arr);
    }
}

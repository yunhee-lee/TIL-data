public class ForEachDemo {
    public static void main(String args[]) {
        int[] arrayOfInts = {32, 87, 3, 589, 12, 1076, 2000, 8, 622, 127};

        String result = "";
        for(int element : arrayOfInts) {
            result += String.valueOf(element) + " ";
            // System.out.print(element + " ");
        }
        System.out.println(result);
    }
}

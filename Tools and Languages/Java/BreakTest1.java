public class BreakTest1 {
    public static void main(String args[]) {
        int nSum = 0;
        int i = 1;
        while(true) {
            nSum += 1;
            System.out.println(nSum);
            i++;
            if(i > 10) break;
        }
    }
}

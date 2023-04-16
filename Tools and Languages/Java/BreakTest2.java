public class BreakTest2 {
    public static void main(String args[]) {
        int n;
        // 입력 값이 10보다 크면 20을 곱한 값을 출력
        // 입력 값이 10보다 같거나 작으면 200을 곱한 값을 출력
        my_block1:
        {
            n = Integer.parseInt(args[0]);
            if(n > 10) break my_block1;
            n = n * 10;
        }
        n = n * 20;
        System.out.println(n);
    }
}

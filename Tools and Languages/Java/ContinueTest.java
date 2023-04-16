public class ContinueTest {
    // 1부터 100까지 정수 중에서 홀수만 더하여 총합을 구하는 프로그램
    public static void main(String args[]) {
        int nSum = 0;
        for(int i = 1; i <= 100; i++) {
            if(i % 2 == 0) continue;
            nSum += i;
        }
        System.out.println(nSum);
    }
}

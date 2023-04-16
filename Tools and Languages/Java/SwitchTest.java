public class SwitchTest {
	public static void main(String args[]) {
		int n = Integer.parseInt(args[0]);
		switch(n) {
			case 10:
				System.out.println("10 입니다");
				break;
			case 20:
				System.out.println("20 입니다");
				break;
			case 30:
				System.out.println("30 입니다");
				break;
			default:
				System.out.println("모르겠습니다");
				break;
		}
	}
}
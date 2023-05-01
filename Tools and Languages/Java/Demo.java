interface Inf1 {
    int a = 10;

    public void method1();
}

interface Inf2 extends Inf1 {
    int a = 20;

    public void method2();
    default void method3() {
        System.out.println(a + Inf1.a);
    }
}

public class Demo implements Inf2 {
    public void method1() {
        System.out.println(a);
    }
    public void method2() {
        System.out.println(a);
    }
    public static void main(String[] args) {
        Inf2 obj = new Demo();
        obj.method2();
        obj.method3();
    }
}

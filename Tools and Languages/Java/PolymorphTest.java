class A {
    public void func() {System.out.print("a");}
}
class B extends A {
    public void func() {System.out.print("b");}
}
class C extends B {
}

public class PolymorphTest {
    public static void main(String args[]) {
        A a = new B();
        a.func();

        a = new C();
        a.func();
    }   
}

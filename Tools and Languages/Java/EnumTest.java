enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
}
public class EnumTest {
    public static void main(String args[]) {
        Day day = Day.MONDAY;
        System.out.println(day);

        if(day == Day.SATURDAY || day == Day.SUNDAY)
            System.out.println("Weekend");
        else   
            System.out.println("Weekday");
        
        for (Day d : Day.values()) {
            System.out.println(d);
        }
    }
}

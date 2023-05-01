public class Electronics {
    private int nVoltage = 0;

    public void turnOn(int nInputVoltage) {
        nVoltage = nInputVoltage;
    }

    public void turnOff() {nVoltage = 0;}
    public int getVoltage() {return nVoltage;}
}

package models;

public class Remaining_Fees {
	public Remaining_Fees() {
		super();
	}
	String rollnumber;
	int slab;
	float tution_fee;
	public Remaining_Fees(String rollnumber, int slab) {
		super();
		this.rollnumber = rollnumber;
		this.slab = slab;
	}
	public float getTution_fee() {
		return tution_fee;
	}
	public void setTution_fee(float tution_fee) {
		this.tution_fee = tution_fee;
	}
	public Remaining_Fees(String rollnumber, int slab, float tution_fee) {
		super();
		this.rollnumber = rollnumber;
		this.slab = slab;
		this.tution_fee = tution_fee;
	}
	public String getRollnumber() {
		return rollnumber;
	}
	public void setRollnumber(String rollnumber) {
		this.rollnumber = rollnumber;
	}
	public int getSlab() {
		return slab;
	}
	public void setSlab(int slab) {
		this.slab = slab;
	}
	
}

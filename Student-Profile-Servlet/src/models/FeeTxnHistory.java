package models;

import java.sql.Date;

public class FeeTxnHistory {
	protected String txn_number;	
	protected String bank;
	protected String roll_number;
	protected Date txn_date;
	protected String txn_purpose;
	protected float txn_amt;
	protected int receipt_no;
	
	public FeeTxnHistory(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt, int receipt_no) {
		super();
		this.txn_number = txn_number;
		this.bank = bank;
		this.roll_number = roll_number;
		this.txn_date = txn_date;
		this.txn_purpose = txn_purpose;
		this.txn_amt = txn_amt;
		this.receipt_no = receipt_no;
	}
	
	public String getTxn_number() {
		return txn_number;
	}
	public void setTxn_number(String txn_number) {
		this.txn_number = txn_number;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getRoll_number() {
		return roll_number;
	}
	public void setRoll_number(String roll_number) {
		this.roll_number = roll_number;
	}
	public Date getTxn_date() {
		return txn_date;
	}
	public void setTxn_date(Date txn_date) {
		this.txn_date = txn_date;
	}
	public String getTxn_purpose() {
		return txn_purpose;
	}
	public void setTxn_purpose(String txn_purpose) {
		this.txn_purpose = txn_purpose;
	}
	public float getTxn_amt() {
		return txn_amt;
	}
	public void setTxn_amt(float txn_amt) {
		this.txn_amt = txn_amt;
	}
	public int getReceipt_no() {
		return receipt_no;
	}
	public void setReceipt_no(int receipt_no) {
		this.receipt_no = receipt_no;
	}
}

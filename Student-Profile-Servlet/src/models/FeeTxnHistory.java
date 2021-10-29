package models;

import java.sql.Date;

public class FeeTxnHistory {
	public FeeTxnHistory(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt, String payment_mode, boolean approved) {
		super();
		this.txn_number = txn_number;
		this.bank = bank;
		this.roll_number = roll_number;
		this.txn_date = txn_date;
		this.txn_purpose = txn_purpose;
		this.txn_amt = txn_amt;
		this.payment_mode = payment_mode;
		this.approved = approved;
	}

	protected String txn_number;	
	protected String bank;
	protected String roll_number;
	protected Date txn_date;
	protected String txn_purpose;
	protected float txn_amt;
	protected int receipt_no;
	protected String staff;
	protected String payment_mode;
	protected String file_path;
	protected boolean approved;
	
	public FeeTxnHistory(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt, String staff) {
		super();
		this.txn_number = txn_number;
		this.bank = bank;
		this.roll_number = roll_number;
		this.txn_date = txn_date;
		this.txn_purpose = txn_purpose;
		this.txn_amt = txn_amt;
		this.staff = staff;
	}
	
	public FeeTxnHistory(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt) {
		super();
		this.txn_number = txn_number;
		this.bank = bank;
		this.roll_number = roll_number;
		this.txn_date = txn_date;
		this.txn_purpose = txn_purpose;
		this.txn_amt = txn_amt;
	}
	public FeeTxnHistory(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt, int receipt_no, String staff) {
		super();
		this.txn_number = txn_number;
		this.bank = bank;
		this.roll_number = roll_number;
		this.txn_date = txn_date;
		this.txn_purpose = txn_purpose;
		this.txn_amt = txn_amt;
		this.receipt_no = receipt_no;
		this.staff = staff;	
	}
	
	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
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

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}
}

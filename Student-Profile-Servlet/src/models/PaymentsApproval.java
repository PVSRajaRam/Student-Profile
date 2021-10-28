package models;

import java.sql.Date;

public class PaymentsApproval extends FeeTxnHistory {
	protected String file_path;
	protected String payment_mode;
	public PaymentsApproval(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt, String mode, String filepath) {
		super(txn_number, bank, roll_number, txn_date, txn_purpose, txn_amt);
		this.payment_mode=mode;
		this.file_path=filepath;
	}

	public PaymentsApproval(String txn_number, String bank, String roll_number, Date txn_date, String txn_purpose,
			float txn_amt,String mode) {
		super(txn_number, bank, roll_number, txn_date, txn_purpose, txn_amt);
		this.payment_mode = mode;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
}

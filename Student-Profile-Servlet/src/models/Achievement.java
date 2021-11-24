package models;

import java.sql.Blob;
import java.util.Date;

public class Achievement {
    protected int id, achievement_type_id, verified;
    protected String student_id, achievement_type, title;
    protected Date proof_date;
    protected Blob proof_file;

	public Date getProof_date() {
		return proof_date;
	}

	public int getAchievement_type_id() {
		return achievement_type_id;
	}

	public Blob getProof_file() {
		return proof_file;
	}

	public int getVerified() {
		return verified;
	}

	public void setVerified(int verified) {
		this.verified = verified;
	}

	public void setProof_file(Blob proof_file) {
		this.proof_file = proof_file;
	}

	public void setAchievement_type_id(int achievement_type_id) {
		this.achievement_type_id = achievement_type_id;
	}



	public void setProof_date(Date proof_date) {
		this.proof_date = proof_date;
	}

	@Override
	public String toString() {
		return "Achievement [id=" + id + ", achievement_type_id=" + achievement_type_id + ", verified=" + verified
				+ ", student_id=" + student_id + ", achievement_type=" + achievement_type + ", title=" + title
				+ ", proof_date=" + proof_date + ", proof_file=" + proof_file + "]";
	}

	public Achievement(String student_id, int achievement_type_id, String title,
			Date proof_date) {
		super();
		this.student_id = student_id;
		this.achievement_type_id = achievement_type_id;
		this.title = title;
		this.proof_date = proof_date;
	}

	public Achievement(int id, String student_id, String achievement_type, String title, Date proof_date, int verified) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.achievement_type = achievement_type;
		this.title = title;
		this.proof_date = proof_date;
		this.verified = verified;
	}

    // public Achievement(int id, String student_id, String achievement_type, String title, Date proof_date, int verified, String student_id) {
	// 	super();
	// 	this.id = id;
	// 	this.student_id = student_id;
	// 	this.achievement_type = achievement_type;
	// 	this.title = title;
	// 	this.proof_date = proof_date;
	// 	this.verified = verified;
	// 	this.student_id = student_id;
	// }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getAchievement_type() {
		return achievement_type;
	}

	public void setAchievement_type(String achievement_type) {
		this.achievement_type = achievement_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}

package models;

import java.util.Date;

public class Achievement {
    protected int id, achievement_type_id;
    protected String student_id, achievement_type, title;
    protected Date proof_date;
    
    public Achievement(String student_id, String title, Date proof_date, int achievement_type_id) {
		super();
		this.achievement_type_id = achievement_type_id;
		this.student_id = student_id;
		this.title = title;
		this.proof_date = proof_date;
	}
   
	public Achievement(int id, String student_id, String achievement_type, String title, Date proof_date) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.achievement_type = achievement_type;
		this.title = title;
		this.proof_date = proof_date;
	}

	public Date getProof_date() {
		return proof_date;
	}

	public int getAchievement_type_id() {
		return achievement_type_id;
	}

	public void setAchievement_type_id(int achievement_type_id) {
		this.achievement_type_id = achievement_type_id;
	}

	public void setProof_date(Date proof_date) {
		this.proof_date = proof_date;
	}

	@Override
	public String toString() {
		return "Achievement [id=" + id + ", student_id=" + student_id + ", achievement_type=" + achievement_type
				+ ", title=" + title + ", proof_date=" + proof_date + "]";
	}

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

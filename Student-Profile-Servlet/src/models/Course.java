package models;

public class Course {
    protected int courses_id, semsester, credits, applied, verified;
    protected String course_code, course_name, dept_name, student_id;

    public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public int getCourses_id() {
        return courses_id;
    }

    public int getApplied() {
        return applied;
    }

    public void setApplied(int applied) {
        this.applied = applied;
    }

    public int getVerified() {
        return verified;
    }

    public void setVerified(int verified) {
        this.verified = verified;
    }

    public void setCourses_id(int courses_id) {
        this.courses_id = courses_id;
    }

    public int getSemsester() {
        return semsester;
    }

    public void setSemsester(int semsester) {
        this.semsester = semsester;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public Course(int courses_id, String course_code, String course_name, int credits, String dept_name, int applied,
            int verified) {
        super();
        this.courses_id = courses_id;
        this.credits = credits;
        this.applied = applied;
        this.verified = verified;
        this.course_code = course_code;
        this.course_name = course_name;
        this.dept_name = dept_name;
    }

    public Course(String student_id, int courses_id, String course_code, String course_name, int credits, int applied,
            int verified) {
        super();
        this.courses_id = courses_id;
        this.student_id = student_id;
        this.credits = credits;
        this.applied = applied;
        this.verified = verified;
        this.course_code = course_code;
        this.course_name = course_name;
        // this.dept_name = dept_name;
    }

}

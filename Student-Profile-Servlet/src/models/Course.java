package models;

public class Course {
    protected int courses_id, semsester, credits;
    protected String course_code, course_name, dept_name;
	@Override
	public String toString() {
		return "Course [courses_id=" + courses_id + ", semsester=" + semsester + ", credits=" + credits
				+ ", course_code=" + course_code + ", course_name=" + course_name + ", dept_name=" + dept_name + "]";
	}
	public int getCourses_id() {
		return courses_id;
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

	public Course(int courses_id, String course_code, String course_name, int credits, String dept_name) {
		super();
		this.courses_id = courses_id;
		this.credits = credits;
		this.course_code = course_code;
		this.course_name = course_name;
		this.dept_name = dept_name;
	}
}

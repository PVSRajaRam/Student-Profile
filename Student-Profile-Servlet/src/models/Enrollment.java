package models;

public class Enrollment
{
	private String _roll_number;
	public String getroll_number()
	{
		return this._roll_number;
	}
	public void setroll_number(String value)
	{
		this._roll_number = value;
	}

	private String _enrollment_number;
	public String getenrollment_number()
	{
		return this._enrollment_number;
	}
	public void setenrollment_number(String value)
	{
		this._enrollment_number = value;
	}

	private String _admitted_campus;
	public String getadmitted_campus()
	{
		return this._admitted_campus;
	}
	public void setadmitted_campus(String value)
	{
		this._admitted_campus = value;
	}

	private String _program;
	public String getprogram()
	{
		return this._program;
	}
	public void setprogram(String value)
	{
		this._program = value;
	}

	private String _branch;
	public String getbranch()
	{
		return this._branch;
	}
	public void setbranch(String value)
	{
		this._branch = value;
	}

	private int _joining_year;
	public int getjoining_year()
	{
		return this._joining_year;
	}
	public void setjoining_year(int value)
	{
		this._joining_year = value;
	}

	private String _section;
	public String getsection()
	{
		return this._section;
	}
	public void setsection(String value)
	{
		this._section = value;
	}

	private int _current_year;
	public int getcurrent_year()
	{
		return this._current_year;
	}
	public void setcurrent_year(int value)
	{
		this._current_year = value;
	}

	private int _current_sem;
	public int getcurrent_sem()
	{
		return this._current_sem;
	}
	public void setcurrent_sem(int value)
	{
		this._current_sem = value;
	}

	private String _classadvisor_name;
	public String getclassadvisor_name()
	{
		return this._classadvisor_name;
	}
	public void setclassadvisor_name(String value)
	{
		this._classadvisor_name = value;
	}

	private String _classadvisor_phone;
	public String getclassadvisor_phone()
	{
		return this._classadvisor_phone;
	}
	public void setclassadvisor_phone(String value)
	{
		this._classadvisor_phone = value;
	}

	private java.sql.Date _enrollment_date;
	public java.sql.Date getenrollment_date()
	{
		return this._enrollment_date;
	}
	public void setenrollment_date(java.sql.Date value)
	{
		this._enrollment_date = value;
	}

	private String _enrollment_status;
	public String getenrollment_status()
	{
		return this._enrollment_status;
	}
	public void setenrollment_status(String value)
	{
		this._enrollment_status = value;
	}

	private String _qualifying_exam;
	public String getqualifying_exam()
	{
		return this._qualifying_exam;
	}
	public void setqualifying_exam(String value)
	{
		this._qualifying_exam = value;
	}

	private String _qualifying_exam_state;
	public String getqualifying_exam_state()
	{
		return this._qualifying_exam_state;
	}
	public void setqualifying_exam_state(String value)
	{
		this._qualifying_exam_state = value;
	}

	private String _admission_type;
	public String getadmission_type()
	{
		return this._admission_type;
	}
	public void setadmission_type(String value)
	{
		this._admission_type = value;
	}

	private String _scholarship;
	public String getscholarship()
	{
		return this._scholarship;
	}
	public void setscholarship(String value)
	{
		this._scholarship = value;
	}


	public Enrollment(String roll_number_,String enrollment_number_,String admitted_campus_,String program_,String branch_,int joining_year_,String section_,int current_year_,int current_sem_,String classadvisor_name_,String classadvisor_phone_,java.sql.Date enrollment_date_,String enrollment_status_,String qualifying_exam_,String qualifying_exam_state_,String admission_type_,String scholarship_)
	{
		this._roll_number = roll_number_;
		this._enrollment_number = enrollment_number_;
		this._admitted_campus = admitted_campus_;
		this._program = program_;
		this._branch = branch_;
		this._joining_year = joining_year_;
		this._section = section_;
		this._current_year = current_year_;
		this._current_sem = current_sem_;
		this._classadvisor_name = classadvisor_name_;
		this._classadvisor_phone = classadvisor_phone_;
		this._enrollment_date = enrollment_date_;
		this._enrollment_status = enrollment_status_;
		this._qualifying_exam = qualifying_exam_;
		this._qualifying_exam_state = qualifying_exam_state_;
		this._admission_type = admission_type_;
		this._scholarship = scholarship_;
	}
}

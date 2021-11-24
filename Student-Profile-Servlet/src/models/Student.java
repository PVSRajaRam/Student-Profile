package models;

public class Student
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

	private String _first_name;
	public String getfirst_name()
	{
		return this._first_name;
	}
	public void setfirst_name(String value)
	{
		this._first_name = value;
	}

	private String _last_name;
	public String getlast_name()
	{
		return this._last_name;
	}
	public void setlast_name(String value)
	{
		this._last_name = value;
	}

	private String _email;
	public String getemail()
	{
		return this._email;
	}
	public void setemail(String value)
	{
		this._email = value;
	}

	private String _personal_email;
	public String getpersonal_email()
	{
		return this._personal_email;
	}
	public void setpersonal_email(String value)
	{
		this._personal_email = value;
	}

	private String _phone;
	public String getphone()
	{
		return this._phone;
	}
	public void setphone(String value)
	{
		this._phone = value;
	}

	private int _achievement_achievement_id;
	public int getachievement_achievement_id()
	{
		return this._achievement_achievement_id;
	}
	public void setachievement_achievement_id(int value)
	{
		this._achievement_achievement_id = value;
	}

	private String _gender;
	public String getgender()
	{
		return this._gender;
	}
	public void setgender(String value)
	{
		this._gender = value;
	}

	private java.sql.Date _dob;
	public java.sql.Date getdob()
	{
		return this._dob;
	}
	public void setdob(java.sql.Date value)
	{
		this._dob = value;
	}

	private String _nationality;
	public String getnationality()
	{
		return this._nationality;
	}
	public void setnationality(String value)
	{
		this._nationality = value;
	}

	private String _native_state;
	public String getnative_state()
	{
		return this._native_state;
	}
	public void setnative_state(String value)
	{
		this._native_state = value;
	}

	private String _mother_tongue;
	public String getmother_tongue()
	{
		return this._mother_tongue;
	}
	public void setmother_tongue(String value)
	{
		this._mother_tongue = value;
	}

	private String _country_of_residence;
	public String getcountry_of_residence()
	{
		return this._country_of_residence;
	}
	public void setcountry_of_residence(String value)
	{
		this._country_of_residence = value;
	}

	private String _aadhar_no;
	public String getaadhar_no()
	{
		return this._aadhar_no;
	}
	public void setaadhar_no(String value)
	{
		this._aadhar_no = value;
	}

	private String _address;
	public String getaddress()
	{
		return this._address;
	}
	public void setaddress(String value)
	{
		this._address = value;
	}

	private String _picture_fpath;
	public String getpicture_fpath()
	{
		return this._picture_fpath;
	}
	public void setpicture_fpath(String value)
	{
		this._picture_fpath = value;
	}


	public Student(String roll_number_,String first_name_,String last_name_,String email_,String personal_email_,String phone_,int achievement_achievement_id_,String gender_,java.sql.Date dob_,String nationality_,String native_state_,String mother_tongue_,String country_of_residence_,String aadhar_no_,String address_,String picture_fpath_)
	{
		this._roll_number = roll_number_;
		this._first_name = first_name_;
		this._last_name = last_name_;
		this._email = email_;
		this._personal_email = personal_email_;
		this._phone = phone_;
		this._achievement_achievement_id = achievement_achievement_id_;
		this._gender = gender_;
		this._dob = dob_;
		this._nationality = nationality_;
		this._native_state = native_state_;
		this._mother_tongue = mother_tongue_;
		this._country_of_residence = country_of_residence_;
		this._aadhar_no = aadhar_no_;
		this._address = address_;
		this._picture_fpath = picture_fpath_;
	}
}

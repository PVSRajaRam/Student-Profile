package models;

public class DisciplinaryActions
{
	private int _id;
	public int getid()
	{
		return this._id;
	}
	public void setid(int value)
	{
		this._id = value;
	}

	private String _roll_number;
	public String getroll_number()
	{
		return this._roll_number;
	}
	public void setroll_number(String value)
	{
		this._roll_number = value;
	}

	private java.sql.Date _report_date;
	public java.sql.Date getreport_date()
	{
		return this._report_date;
	}
	public void setreport_date(java.sql.Date value)
	{
		this._report_date = value;
	}

	private java.sql.Time _report_time;
	public java.sql.Time getreport_time()
	{
		return this._report_time;
	}
	public void setreport_time(java.sql.Time value)
	{
		this._report_time = value;
	}

	private String _place;
	public String getplace()
	{
		return this._place;
	}
	public void setplace(String value)
	{
		this._place = value;
	}

	private String _category;
	public String getcategory()
	{
		return this._category;
	}
	public void setcategory(String value)
	{
		this._category = value;
	}

	private java.sql.Date _notice_till;
	public java.sql.Date getnotice_till()
	{
		return this._notice_till;
	}
	public void setnotice_till(java.sql.Date value)
	{
		this._notice_till = value;
	}

	private String _reporting_authority;
	public String getreporting_authority()
	{
		return this._reporting_authority;
	}
	public void setreporting_authority(String value)
	{
		this._reporting_authority = value;
	}

	private String _details;
	public String getdetails()
	{
		return this._details;
	}
	public void setdetails(String value)
	{
		this._details = value;
	}

	private String _action;
	public String getaction()
	{
		return this._action;
	}
	public void setaction(String value)
	{
		this._action = value;
	}


	public DisciplinaryActions(int id_,String roll_number_,java.sql.Date report_date_,java.sql.Time report_time_,String place_,String category_,java.sql.Date notice_till_,String reporting_authority_,String details_,String action_)
	{
		this._id = id_;
		this._roll_number = roll_number_;
		this._report_date = report_date_;
		this._report_time = report_time_;
		this._place = place_;
		this._category = category_;
		this._notice_till = notice_till_;
		this._reporting_authority = reporting_authority_;
		this._details = details_;
		this._action = action_;
	}
}

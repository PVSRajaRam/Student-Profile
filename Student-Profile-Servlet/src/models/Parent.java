package models;

public class Parent
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

	private String _relation;
	public String getrelation()
	{
		return this._relation;
	}
	public void setrelation(String value)
	{
		this._relation = value;
	}

	private String _name;
	public String getname()
	{
		return this._name;
	}
	public void setname(String value)
	{
		this._name = value;
	}

	private String _office_phone;
	public String getoffice_phone()
	{
		return this._office_phone;
	}
	public void setoffice_phone(String value)
	{
		this._office_phone = value;
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

	private String _occupation;
	public String getoccupation()
	{
		return this._occupation;
	}
	public void setoccupation(String value)
	{
		this._occupation = value;
	}

	private String _office_address;
	public String getoffice_address()
	{
		return this._office_address;
	}
	public void setoffice_address(String value)
	{
		this._office_address = value;
	}

	private int _annual_income;
	public int getannual_income()
	{
		return this._annual_income;
	}
	public void setannual_income(int value)
	{
		this._annual_income = value;
	}

	private boolean _primary_contact;
	public boolean getprimary_contact()
	{
		return this._primary_contact;
	}
	public void setprimary_contact(boolean value)
	{
		this._primary_contact = value;
	}


	public Parent(String roll_number_,String relation_,String name_,String office_phone_,String email_,String occupation_,String office_address_,int annual_income_,boolean primary_contact_)
	{
		this._roll_number = roll_number_;
		this._relation = relation_;
		this._name = name_;
		this._office_phone = office_phone_;
		this._email = email_;
		this._occupation = occupation_;
		this._office_address = office_address_;
		this._annual_income = annual_income_;
		this._primary_contact = primary_contact_;
	}
}

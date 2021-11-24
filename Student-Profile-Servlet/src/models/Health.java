package models;

public class Health
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

	private String _blood_group;
	public String getblood_group()
	{
		return this._blood_group;
	}
	public void setblood_group(String value)
	{
		this._blood_group = value;
	}

	private String _allergies;
	public String getallergies()
	{
		return this._allergies;
	}
	public void setallergies(String value)
	{
		this._allergies = value;
	}

	private String _remarks;
	public String getremarks()
	{
		return this._remarks;
	}
	public void setremarks(String value)
	{
		this._remarks = value;
	}


	public Health(String roll_number_,String blood_group_,String allergies_,String remarks_)
	{
		this._roll_number = roll_number_;
		this._blood_group = blood_group_;
		this._allergies = allergies_;
		this._remarks = remarks_;
	}
}

package models;

public class Dayscholar
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

	private String _route;
	public String getroute()
	{
		return this._route;
	}
	public void setroute(String value)
	{
		this._route = value;
	}

	private String _boarding_point;
	public String getboarding_point()
	{
		return this._boarding_point;
	}
	public void setboarding_point(String value)
	{
		this._boarding_point = value;
	}


	public Dayscholar(String roll_number_,String route_,String boarding_point_)
	{
		this._roll_number = roll_number_;
		this._route = route_;
		this._boarding_point = boarding_point_;
	}
}

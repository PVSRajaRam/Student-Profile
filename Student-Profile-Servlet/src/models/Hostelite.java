package models;

public class Hostelite
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

	private String _hostel_name;
	public String gethostel_name()
	{
		return this._hostel_name;
	}
	public void sethostel_name(String value)
	{
		this._hostel_name = value;
	}

	private String _block;
	public String getblock()
	{
		return this._block;
	}
	public void setblock(String value)
	{
		this._block = value;
	}

	private int _room;
	public int getroom()
	{
		return this._room;
	}
	public void setroom(int value)
	{
		this._room = value;
	}

	private boolean _in_campus;
	public boolean getin_campus()
	{
		return this._in_campus;
	}
	public void setin_campus(boolean value)
	{
		this._in_campus = value;
	}


	public Hostelite(String roll_number_,String hostel_name_,String block_,int room_,boolean in_campus_)
	{
		this._roll_number = roll_number_;
		this._hostel_name = hostel_name_;
		this._block = block_;
		this._room = room_;
		this._in_campus = in_campus_;
	}
}
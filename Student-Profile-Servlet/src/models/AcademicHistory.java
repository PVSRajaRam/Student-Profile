package models;

public class AcademicHistory
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

	private String _qualification;
	public String getqualification()
	{
		return this._qualification;
	}
	public void setqualification(String value)
	{
		this._qualification = value;
	}

	private String _board;
	public String getboard()
	{
		return this._board;
	}
	public void setboard(String value)
	{
		this._board = value;
	}

	private String _institution;
	public String getinstitution()
	{
		return this._institution;
	}
	public void setinstitution(String value)
	{
		this._institution = value;
	}

	private int _no_of_attempts;
	public int getno_of_attempts()
	{
		return this._no_of_attempts;
	}
	public void setno_of_attempts(int value)
	{
		this._no_of_attempts = value;
	}

	private float _score;
	public float getscore()
	{
		return this._score;
	}
	public void setscore(float value)
	{
		this._score = value;
	}

	private String _proof_fpath;
	public String getproof_fpath()
	{
		return this._proof_fpath;
	}
	public void setproof_fpath(String value)
	{
		this._proof_fpath = value;
	}


	public AcademicHistory(String roll_number_,String qualification_,String board_,String institution_,int no_of_attempts_,float score_,String proof_fpath_)
	{
		this._roll_number = roll_number_;
		this._qualification = qualification_;
		this._board = board_;
		this._institution = institution_;
		this._no_of_attempts = no_of_attempts_;
		this._score = score_;
		this._proof_fpath = proof_fpath_;
	}
}

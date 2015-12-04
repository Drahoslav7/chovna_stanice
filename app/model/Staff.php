<?php

namespace App\Model;


/**
 * Dog model.
 */
class Staff extends BaseModel {


	protected $funcArray = [
		"CHV" => "Chovatel",
		"SPR" => "Správce",
	];

    public function getStaff()
    {
        return $this->db->query('SELECT * FROM uzivatel JOIN uzivatel_zamestnanec USING (Login) ORDER BY Zkr_fce,Login');
    }

    public function getStaffByID($id)
    {
    	return $this->db->table('uzivatel')->where('Login', $id)->fetch();
    }

	public function getFunction($funcCode)
	{
		return $funcArray[$funcCode];
	}
}

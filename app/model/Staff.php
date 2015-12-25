<?php

namespace App\Model;


/**
 * Staff model.
 */
class Staff extends BaseModel {


	protected $funcArray = [
		"CHV" => "Chovatel",
		"SPR" => "Správce",
	];

	public function getStaff()
	{
		return $this->db->query('SELECT * FROM Uzivatel JOIN Uzivatel_zamestnanec USING (Login) WHERE !_deleted ORDER BY Role,Login');
	}

	public function getStaffByID($id)
	{
		return $this->db->table('Uzivatel')->where('Login', $id)->fetch();
	}

	public function deleteStaff($id)
	{
		return $this->db->query('UPDATE Uzivatel SET _deleted = 1 WHERE Login=?', $id);
	}

	public function getFunction($funcCode)
	{
		return $funcArray[$funcCode];
	}
}

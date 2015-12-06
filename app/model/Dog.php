<?php

namespace App\Model;


/**
 * Dog model.
 */
class Dog extends BaseModel {

    public function getDogs()
    {
        return $this->db->query('SELECT ps.*, pp.Nazev AS NazevPlemena FROM pes ps JOIN pes_plemeno pp ON ps.plemeno_ID = pp.ID;');
    }

	public function getDogByID($id)
	{
		return $this->db->query('SELECT ps.*, pp.Nazev AS NazevPlemena FROM pes ps JOIN pes_plemeno pp ON ps.plemeno_ID = pp.ID WHERE ps.ID = ?', $id)->fetch();
	}

}

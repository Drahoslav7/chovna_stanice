<?php

namespace App\Model;


/**
 * Dog model.
 */
class Dog extends BaseModel {

    public function getDogs()
    {
        return $this->db->query('SELECT * FROM pes JOIN (SELECT ID as ID_2, Nazev AS Plemeno FROM pes_plemeno ) AS plemeno  WHERE plemeno.ID_2 = Plemeno_ID');
    }

	public function getRaces()
	{
		return $this->db->table('pes_plemeno');
	}

}

<?php

namespace App\Model;


/**
 * Dog model.
 */
class Dog extends BaseModel {

    public function getDogs()
    {
        return $this->db->table('pes');
    }

	public function getRaces()
	{
		return $this->db->table('pes_plemeno');
	}

}

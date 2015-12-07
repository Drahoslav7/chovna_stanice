<?php

namespace App\Model;


/**
 * Order model.
 */
class Client extends BaseModel {

    public function getClients()
    {
        return $this->db->query('SELECT ob.*, ps.Jmeno, ps.Pohlavi FROM Objednavka ob JOIN Pes ps ON ob.pes_ID = ps.ID ORDER BY ob.Datum');
    }

    public function getClientByLogin($login)
    {
    	return $this->db->query('SELECT * FROM uzivatel WHERE Login = ?', $login)->fetch();
    }
}

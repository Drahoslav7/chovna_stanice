<?php

namespace App\Model;


/**
 * Order model.
 */
class Order extends BaseModel {

    public function getOrder()
    {
        return $this->db->query('SELECT ob.*, ps.Jmeno, ps.Pohlavi FROM Objednavka ob JOIN Pes ps ON ob.pes_ID = ps.ID ORDER BY ob.Datum');
    }

    public function getOrdersByLogin($login)
    {
		$login = "xlehne01";
    	return $this->db->query('SELECT ob.*, ps.Jmeno, ps.Pohlavi FROM Objednavka ob JOIN Pes ps ON ob.pes_ID = ps.ID WHERE Uzivatel_Login = ? ORDER BY ob.Datum', $login);
    }
}

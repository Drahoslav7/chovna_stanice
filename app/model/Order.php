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
    	return $this->db->query('SELECT ob.*, ps.Jmeno, ps.Pohlavi FROM Objednavka ob JOIN Pes ps ON ob.pes_ID = ps.ID WHERE Uzivatel_Login = ? ORDER BY ob.Datum', $login);
    }
	
	public function getOrderByDoGIDAndLogin($id, $login)
	{
		return $this->db->query('SELECT * FROM Objednavka WHERE Uzivatel_Login = ? AND Pes_ID = ?', $login, $id)->fetch();
	}
	
	public function getOrderByDoGID($id)
	{
		return $this->db->query('SELECT * FROM Objednavka WHERE Pes_ID = ?', $id)->fetchAll();
	}
	
	public function getOrderByID($id)
	{
		return $this->db->query('SELECT * FROM Objednavka WHERE ID = ?', $id)->fetch();
	}
	
	public function confirmOrderByID($id, $dogID)
	{
		$this->db->query('UPDATE Objednavka SET Stav = 2 WHERE ID <> ? AND Pes_ID = ?', $id, $dogID);
		return $this->db->query('UPDATE Objednavka SET Stav = 3 WHERE ID = ?', $id);
	}
}

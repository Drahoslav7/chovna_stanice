<?php

namespace App\Model;


/**
 * Dog model.
 */
class Dog extends BaseModel {

	public function getDogs()
	{
		return $this->db->query('SELECT ps.*, pp.Nazev AS NazevPlemena FROM Pes ps JOIN Pes_plemeno pp ON ps.Plemeno_ID = pp.ID WHERE !_deleted ORDER BY ID ASC');
	}

	public function deleteDog($id)
	{
		return $this->db->query('UPDATE Pes SET _deleted = 1 WHERE ID = ?', $id);
	}

	public function getDogByID($id)
	{
		return $this->db->query('SELECT ps.*, pp.Nazev AS NazevPlemena FROM Pes ps JOIN Pes_plemeno pp ON ps.plemeno_ID = pp.ID WHERE ps.ID = ?', $id)->fetch();
	}
	
	public function getDogMeasuresByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_mereni WHERE Pes_ID = ? ORDER BY ID', $id);
	}
	public function getDogMeasureByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_mereni WHERE ID = ?', $id)->fetchAll();
	}
	
	
	public function getDogWeightingsByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_vazeni WHERE Pes_ID = ? ORDER BY ID', $id);
	}
	public function getDogWeightingByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_vazeni WHERE ID = ?', $id)->fetchAll();
	}
	
	
	public function getDogPreventivesByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_vakcinace WHERE Pes_ID = ? ORDER BY Datum ASC', $id);
	}
	public function getDogPreventiveByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_vakcinace WHERE ID = ?', $id)->fetchAll();
	}
	public function getPreventiveDetailByID($id)
	{
		return $this->db->query('SELECT * FROM Vakcina WHERE ID = ?', $id)->fetchAll();
	}
	
	
	public function getDogTrophiesByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_oceneni WHERE Pes_ID = ? ORDER BY ID', $id);
	}
	public function getDogTrophyByID($id)
	{
		return $this->db->query('SELECT * FROM Pes_oceneni WHERE ID = ?', $id)->fetchAll();
	}
	
	public function deleteMeasure($id)
	{
		return $this->db->query('DELETE FROM Pes_mereni WHERE ID = ?', $id);
	}
	
	public function deleteWeighting($id)
	{
		return $this->db->query('DELETE FROM Pes_vazeni WHERE ID = ?', $id);
	}
	
	public function deletePreventive($id)
	{
		return $this->db->query('DELETE FROM Pes_vakcinace WHERE ID = ?', $id);
	}
	
	public function deleteTrophy($id)
	{
		return $this->db->query('DELETE FROM Pes_oceneni WHERE ID = ?', $id);
	}

	public function addDog($values)
	{
		# code...
	}
}

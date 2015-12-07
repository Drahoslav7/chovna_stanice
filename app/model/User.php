<?php

namespace App\Model;

use Nette;

class Users extends BaseModel {


	/**
	 * Registrace clienta
	 */
	public function register($values)
	{
		// $this->db->beginTransaction();
		$ok = $this->newUser($values, 'klient');
		if($ok){
			$this->db->table("uzivatel_klient")->insert(array(
				'Login' => $values->login,
				'F_Ulice' => $values->f_street,
				'F_Mesto' => $values->f_city,
				'F_PSC' => $values->f_postCode,
			));
			// $this->db->commit();
			return true;
		} else {
			// $this->db->rollback();
			return false;
		}

	}

	/**
	 * Ruční vytvoření zaměstnance adminem
	 */
	public function add($values)
	{
		$role;
		switch ($values->role){
			case 'admin':
				$role = 'spravce';
				break;
			case 'keeper':
				$role = 'chovatel';
				break;
			default:
				return false;
		}
		// $this->db->beginTransaction();

		$ok = $this->newUser($values, $role);
		if($ok){
			$this->db->table("uzivatel_klient")->insert(array(
				'Login' => $values->login,
				'Plat' => $values->salary
			));
			// $this->db->commit();
			return true;
		} else {
			// $this->db->rollback();
			return false;
		}
	}

	private function newUser($values, $role)
	{
		$ok = $this->db->table("uzivatel")->insert(array(
			'Login' => $values->login,
			'Heslo' => hash('sha512', $values->password),
			'Jmeno' => $values->firstName,
			'Prijmeni' => $values->lastName,
			'K_Ulice' => $values->street,
			'K_Mesto' => $values->city,
			'K_PSC' => $values->postCode,
			'K_Telefon' => $values->phone,
			'Email' => $values->email,
			'Role' => $role
		));
		return true; // TODO overit
	}

}

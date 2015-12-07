<?php

namespace App\Model;

use Nette;

class Users extends BaseModel {


	public function register($values)
	{
		// var_dump($values);
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
			'Role' => "klient"
		));
		$ok = true; // TODO overit zda se poved predchozi dotaz
		if($ok){
			$this->db->table("uzivatel_klient")->insert(array(
				'Login' => $values->login,
				'F_Ulice' => $values->f_street,
				'F_Mesto' => $values->f_city,
				'F_PSC' => $values->f_postCode,
			));
			return true;
		} else {
			return false;
		}

	}

}

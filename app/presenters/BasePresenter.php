<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class BasePresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	protected $database;
	protected $mDog;

	public function __construct(Nette\Database\Context $database, \App\Model\Dog $dogModel)
	{
	    $this->mDog = $dogModel;
		$this->database = $database;
	}

	public function startup()
	{
		parent::startup();
		$this->template->user = $this->getUser();
		$user = $this->template->user;
		$this->template->isAdmin = in_array("spravce", $user->getRoles());
		$this->template->isKeeper = (in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()));
		$this->template->isClient = (in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()) || in_array("klient", $user->getRoles()));
	}
}

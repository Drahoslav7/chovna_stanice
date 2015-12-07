<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class ClientPresenter extends BasePresenter
{
	public function startup()
	{	
		parent::startup();
		if ($this->template->isClient !== true) {
			$this->redirect("Homepage:default");
		}
	}

	public function actionDefault()
	{
		$this->redirect("Client:data");
	}


	public function renderDog($id)
	{
		$id = 7; //TODO Make this dynamic
		$this->template->dog = $this->mDog->getDogByID($id);
	}


	public function renderOrder($login)
	{
		$login = "xlehne01"; //TODO Make this dynamic
		$this->template->orders = $this->mOrder->getOrdersByLogin($login);
	}


	public function renderData($login)
	{
		$login = "xlehne01";
		$this->template->client = $this->mClient->getClientByLogin($login);
	}
}

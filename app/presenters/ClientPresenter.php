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
		$this->template->dog = $this->mDog->getDogByID($id);
	}


	public function renderOrder($id)
	{
		$this->template->orders = $this->mOrder->getOrdersByLogin($id);
	}


	public function renderData($login)
	{
		$this->template->client = $this->mClient->getClientByLogin($login);
	}
}

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


	public function renderDog()
	{

	}


	public function renderOrder($login)
	{
		$this->template->orders = $this->mOrder->getOrdersByLogin($login);
	}


	public function renderData()
	{

	}
}

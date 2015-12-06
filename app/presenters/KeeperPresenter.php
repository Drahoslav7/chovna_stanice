<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;
use App\Model\DogModel;
use App\Model\OrderModel;

class KeeperPresenter extends BasePresenter
{

	public function startup()
	{
		parent::startup();
		if ($this->template->isKeeper !== true) {
			$this->redirect("Homepage:default");
		} 
	}
	public function actionDefault()
	{
		$this->redirect("Keeper:doglist");
	}


	public function renderDog()
	{

	}

	public function renderDoglist()
	{
		$this->template->dogs = $this->mDog->getDogs();
		$this->template->races = $this->mDog->getRaces();
	}


	public function renderOrder($login)
	{
		$this->template->order = NULL;	
		$this->template->orders = [];
		if ($login) {
			$this->template->order = $this->mOrder->getOrdersByLogin($login);
		} else {
			$this->template->orders = $this->mOrder->getOrder();
		}
	}
}

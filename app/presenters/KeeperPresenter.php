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


	public function actionDeleteDog($id)
	{
		if ($this->mDog->deleteDog($id)) {
			$this->flashMessage("Pes s id  $id smazán", 'success');
		} else {
			$this->flashMessage("Psa s $id se nepodařilo smazat", 'danger');
		}
		$this->redirect("Keeper:doglist");
	}


	public function renderDog($id)
	{
		$this->template->dog = NULL;
		$this->template->dogs = [];
		if ($id) {
			$this->template->dog = $this->mDog->getDogByID($id);
		} else {
			$this->template->dogs = $this->mDog->getDogs();
		}
	}

	public function renderDoglist()
	{
		$this->template->dogs = $this->mDog->getDogs();
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

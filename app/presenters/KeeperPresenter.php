<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;
use App\Model\DogModel;
use App\Model\OrderModel;
use Nette\Application\Responses;

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
	
	public function actionGetMeasure($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mDog->getDogMeasureByID($id)));
	}
	
	public function actionGetWeighting($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mDog->getDogWeightingByID($id)));
	}
	
	public function actionGetTrophy($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mDog->getDogTrophyByID($id)));
	}
	
	public function actionGetPreventive($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mDog->getDogPreventiveByID($id)));
	}
	
	public function actionGetPreventiveInfo($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mDog->getPreventiveDetailByID($id)));
	}
	
	public function actionDeleteMeasure($id)
	{
		if ($this->mDog->deleteMeasure($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", 1);
	}
	
	public function actionDeleteWeighting($id)
	{
		if ($this->mDog->deleteWeighting($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", 1);
	}
	
	public function actionDeletePreventive($id)
	{
		if ($this->mDog->deletePreventive($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", 1);
	}
	
	public function actionDeleteTrophy($id)
	{
		if ($this->mDog->deleteTrophy($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", 1);
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
			$this->template->measureHistory = $this->mDog->getDogMeasuresByID($id);
			$this->template->weightHistory = $this->mDog->getDogWeightingsByID($id);
			$this->template->preventiveHistory = $this->mDog->getDogPreventivesByID($id);
			$this->template->trophyHistory = $this->mDog->getDogTrophiesByID($id);
		} else {
			$this->template->dogs = $this->mDog->getDogs();
		}
	}

	public function renderDoglist($id)
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

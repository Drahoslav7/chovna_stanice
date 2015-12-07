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

	public function actionAddDog()
	{
		$form = $this->createComponentAddDogForm();
		$this->addDogFormSubmitted($form);
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
	
	public function actionGetOrder($id)
	{
		$this->sendResponse(new Nette\Application\Responses\JsonResponse($this->mOrder->getOrderByID($id)));
	}
	
	public function actionDeleteMeasure($id)
	{
		$redirectLink = $this->mDog->getDogMeasureByID($id);
		$redirectLink = $redirectLink[0]["Pes_ID"];
		if ($this->mDog->deleteMeasure($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $redirectLink);
	}
	
	public function actionDeleteWeighting($id)
	{
		$redirectLink = $this->mDog->getDogWeightingByID($id);
		$redirectLink = $redirectLink[0]["Pes_ID"];
		if ($this->mDog->deleteWeighting($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $redirectLink);
	}
	
	public function actionDeletePreventive($id)
	{
		$redirectLink = $this->mDog->getDogPreventiveByID($id);
		$redirectLink = $redirectLink[0]["Pes_ID"];
		if ($this->mDog->deletePreventive($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $redirectLink);
	}
	
	public function actionDeleteTrophy($id)
	{
		$redirectLink = $this->mDog->getDogTrophyByID($id);
		$redirectLink = $redirectLink[0]["Pes_ID"];
		if ($this->mDog->deleteTrophy($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $redirectLink);
	}

	public function actionConfirmOrder($id)
	{
		$dogID = $this->mOrder->getOrderByID($id);
		$dogID = $dogID["Pes_ID"];
		if ($this->mOrder->confirmOrderByID($id, $dogID)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $dogID);
	}
	
	public function actionDenyOrder($id)
	{
		$redirectLink = $this->mOrder->getOrderByID($id);
		$redirectLink = $redirectLink["Pes_ID"];
		if ($this->mOrder->denyOrderByID($id)) {
			$this->flashMessage("Záznam $id smazán", 'success');
		} else {
			$this->flashMessage("Záznam $id se nepodařilo smazat", 'danger');
		}
		
		$this->redirect("Keeper:dog", $redirectLink);
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
			$this->template->orders = $this->mOrder->getOrderByDogID($id);
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


		protected function createComponentAddDogForm()
		{
			$form = new Form;
			$form->setAction("/keeper/add-dog/");
			$form->setMethod('POST');

			$form->addText('name')
				->setRequired('Jmeno je povinne');

			$form->

			$form->addRadioList('sex', array(
				'male' => 'samec',
				'female' => 'samice'
			))->setRequired('Výběr pohlavi je povinný');

			$form->addText('chipCode');
			$form->addText('race');
			$form->addText('hairColor');
			$form->addText('hairType');

			$form->addText('father');
			$form->addText('mother');

			$form->addText('hairType');

			$form->addText('breedingStation');


			$form->addSubmit('ok');

			$form->onSuccess[] = array($this, 'addDogFormSubmitted');
			return $form;
		}

		public function addMogFormSubmitted($form)
		{
			$values = $form->getValues();
			foreach ($_POST as $key => $value)
			{
			    $values->$key = $value;
			}
			// var_dump($values);
			try {
				$this->mDog->add($values);
			} catch (Nette\Database\DriverException $e) {
				$form->addError($e->getMessage());
				$this->flashMessage('Přidání psa se nepovedlo, zkontrolujte prosím zadané údaje ' . $e->getMessage(),'danger');
				$this->redirect('Keeper:doglist');
			}
			$this->flashMessage('Přidání psa proběhlo uspěšně', 'success');
			$this->redirect('Keeper:doglist');
		}
}

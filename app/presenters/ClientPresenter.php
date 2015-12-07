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

	public function actionAddOrder($id)
	{
		$form = $this->createComponentAddOrderForm();
		$this->addOrderFormSubmitted($form, $id);
	}


	public function renderDog($id)
	{
		$this->template->dog = $this->mDog->getDogByID($id);
		$this->template->order = $this->mOrder->getOrderByDogIDAndLogin($id, $this->template->user->getId());
	}


	public function renderOrder($id)
	{
		$this->template->orders = $this->mOrder->getOrdersByLogin($id);
	}


	public function renderData($login)
	{
		$this->template->client = $this->mClient->getClientByLogin($login);
	}


	protected function createComponentAddOrderForm()
	{
		$form = new Form;
		$form->setAction("/client/add-order/");
		$form->setMethod('POST');

		$form->addText('price')
			->setType('number')
			->setRequired('Castka je povinna');

		$form->addSubmit('ok');

		$form->onSuccess[] = array($this, 'addOrderFormSubmitted');
		return $form;
	}

	public function addOrderFormSubmitted($form, $dogId)
	{
		$values = $form->getValues();
		foreach ($_POST as $key => $value)
		{
		    $values->$key = $value;
		}

		// var_dump($values);
		try {
			$this->mOrder->add($this->getUser()->getId(), $dogId, $values->price);
		} catch (Nette\Database\DriverException $e) {
			$form->addError($e->getMessage());
			$this->flashMessage('Přidání psa se nepovedlo, zkontrolujte prosím zadané údaje ' . $e->getMessage(),'danger');
			$this->redirect('Keeper:doglist');
		}
		$this->flashMessage('Přidání psa proběhlo uspěšně', 'success');
		$this->redirect('Client:dog', $dogId);
	}
}

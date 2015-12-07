<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class AdminPresenter extends BasePresenter
{

	private $addMemberForm;

	public function startup()
	{
		parent::startup();
		if ($this->template->isAdmin !== true) {
			$this->redirect("Homepage:default");
		}
		$this->addMemberForm = $this->createComponentAddMemberForm();
	}


	public function actionDefault()
	{
		$this->redirect("Admin:Staff");
	}

	public function actionAddStaff()
	{
		$this->addMemberFormSubmitted($this->addMemberForm);
	}
	
	public function actionDeleteStaff($id)
	{
		if ($this->mStaff->deleteStaff($id)) {
			$this->flashMessage("Chovatel $id smazán", 'success');
		} else {
			$this->flashMessage("Chovatele $id se nepodařilo smazat", 'danger');
		}
		$this->redirect("Admin:Staff");
	}


	public function renderStaff($id)
	{
		$this->template->member = NULL;
		$this->template->staff = [];
		if ($id) {
			$this->template->member = $this->mStaff->getStaffByID($id);
		} else {
			$this->template->staff = $this->mStaff->getStaff();
		}
	}


	protected function createComponentAddMemberForm()
	{
		$form = new Form;
		$form->setAction("/admin/add-staff/");
		$form->setMethod('POST');

		$form->addText('login')
			->setRequired()
			->addRule(Form::MAX_LENGTH, 'Login smí mít maximálně %d znaků.', 10);;
;
		$form->addPassword('password')
			->setRequired()
			->addRule(Form::FILLED, 'Vyplňte heslo zaměstnance')
			->addRule(Form::MIN_LENGTH, 'Heslo musí mít alespoň %d znaků.', 6);;
		$form->addText('firstName')->setRequired('Pole Jméno je povinné');
		$form->addText('lastName')->setRequired('Pole Příjmení je povinné');

		$form->addText('email')
			->setRequired('Pole Email je povinné')
			->addRule(Form::EMAIL, 'Neplatná emailová adresa');;

		$form->addText('city')->setRequired('Pole Město je povinné');
		$form->addText('street')->setRequired('Pole Ulice je povinné');
		$form->addText('postCode')->setRequired('Pole PSČ je povinné');
		$form->addText('phone');

		$form->addRadioList('role', array(
			0 => 'admin',
			1 => 'keeper'
		))->setRequired('Výběr funkce je povinný');

		$form->addText('salary')
			->setType('number');

		$form->addSubmit('ok');

		$form->onSuccess[] = $this->addMemberFormSubmitted;
		return $form;
	}

	public function addMemberFormSubmitted($form)
	{
		$values = $form->getValues();
		try {
			$this->mUsers->add($values);
		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError($e->getMessage());
			$this->flashMessage('Registrace se nepovedla, zkontrolujte prosím zadané údaje','danger');
			return;
		}
		$this->flashMessage('Vytvoření zaměstnance proběhlo uspěšně', 'success');

		$this->redirect('Admin:staff');
	}
}

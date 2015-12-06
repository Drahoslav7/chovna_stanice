<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;
use App\Model;
use App\Model\DogModel;

class HomepagePresenter extends BasePresenter
{
	public function actionDefault()
	{
		$form = $this->createComponentSignInForm();
	}

	public function actionLogout()
	{
		$this->getUser()->logout();
		$this->flashMessage('Byl jste odhlášen', 'success');
		$this->redirect('Homepage:default');
	}


	public function renderDefault()
	{
		$this->template->user = $this->getUser();
		$this->template->dogs = $this->mDog->getDogs();
	}


	public function createComponentSignInForm()
	{
		$form = new Form;
		$form->addText('user')->setRequired();
		$form->addPassword('password')->setRequired();
		$form->addSubmit('send');
		$form->onSuccess[] = $this->signInFormSubmitted;
		return $form;
	}


	public function signInFormSubmitted($form)
	{
		$values = $form->getValues();
		$this->getUser()->setExpiration('+ 20 minutes', TRUE);
		try {
			$this->getUser()->login($values->user, $values->password);
		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError($e->getMessage());
			$this->flashMessage('Špatné jméno nebo heslo','danger');
			return;
		}
		$this->redirect('Homepage:');
	}


}

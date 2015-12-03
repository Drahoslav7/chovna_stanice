<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class HomepagePresenter extends BasePresenter
{
	public function actionDefault()
	{
		$form = $this->createComponentSignInForm();
	}

	public function actionLogout()
	{
		// TODO
	}

	public function renderDefault()
	{

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
			return;
		}
		$this->redirect('Homepage:');
	}
}

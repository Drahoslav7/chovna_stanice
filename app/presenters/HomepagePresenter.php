<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class HomepagePresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context */
	private $database;
	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}

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
		$this->template->user = $this->getUser();
		$user = $this->template->user;
		$this->template->isAdmin = in_array("spravce", $user->getRoles());
		$this->template->isKeeper = (in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()));
		$this->template->isClient = (in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()) || in_array("klient", $user->getRoles()));
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

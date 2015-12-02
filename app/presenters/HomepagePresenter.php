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

	}
	public function renderDefault()
	{
		$this->template->test = $this->database->table('test')
			->limit(5);
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

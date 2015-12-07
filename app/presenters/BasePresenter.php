<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class BasePresenter extends Nette\Application\UI\Presenter
{
	/** @var Nette\Database\Context @inject */
	protected $database;

	/** @inject @var \App\Model\Dog */
	protected $mDog;

	/** @inject @var \App\Model\Staff */
	protected $mStaff;

	/** @inject @var \App\Model\Order */
	protected $mOrder;

	/** @inject @var \App\Model\Client */
	protected $mClient;

	/** @inject @var \App\Model\Users */
	protected $mUsers;


	public function __construct(Nette\Database\Context $database, \App\Model\Dog $dogModel, \App\Model\Staff $staffModel, \App\Model\Order $orderModel, \App\Model\Client $clientModel, \App\Model\Users $usersModel)
	{
		$this->mUsers = $usersModel;
		$this->mDog = $dogModel;
		$this->mStaff = $staffModel;
		$this->mOrder = $orderModel;
		$this->mClient = $clientModel;
		$this->database = $database;
	}

	public function startup()
	{
		parent::startup();
		$this->template->user = $this->getUser();
		$user = $this->template->user;
		$this->template->isAdmin = in_array("spravce", $user->getRoles());
		$this->template->isKeeper = (in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()));
		$this->template->isGuest = !(in_array("spravce", $user->getRoles()) || in_array("chovatel", $user->getRoles()) || in_array("klient", $user->getRoles()));
		$this->template->isClient = in_array("klient", $user->getRoles());
	}
	
	public function actionDefault()
	{
		$loginForm = $this->createComponentSignInForm();
		$registerForm = $this->createComponentRegisterForm();
	}

	public function actionLogout()
	{
		$this->getUser()->logout();
		$this->flashMessage('Byl jste odhlášen', 'success');
		$this->redirect('Homepage:default');
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

	public function createComponentRegisterForm()
	{
		$form = new Form;
		$form->addText('login')
			->setRequired()
			->addRule(Form::MAX_LENGTH, 'Login smí mít maximálně %d znaků.', 8);;
;
		$form->addPassword('password')
			->setRequired()
			->addRule(Form::FILLED, 'Vyplňte Vaše heslo')
			->addRule(Form::MIN_LENGTH, 'Heslo musí mít alespoň %d znaků.', 6);;
		$form->addText('firstName')->setRequired();
		$form->addText('lastName')->setRequired();

		$form->addText('email')
			->setRequired()
			->addRule(Form::EMAIL, 'Neplatná emailová adresa');;

		$form->addText('city')->setRequired();
		$form->addText('street')->setRequired();
		$form->addText('postCode')->setRequired();
		$form->addText('phone');

		$form->addText('f_city');
		$form->addText('f_street');
		$form->addText('f_postCode');


		$form->addSubmit('ok');

		$form->onSuccess[] = $this->registerFormSubmitted;
		return $form;
	}

	public function registerFormSubmitted($form)
	{
		$values = $form->getValues();
		try {
			$this->mUsers->register($values);
		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError($e->getMessage());
			$this->flashMessage('Registrace se nepovedla, zkontrolujte prosím zadané údaje','danger');
			return;
		}
		$this->flashMessage('Registrace proběhla uspěšně, můžete se přihlásit','success');

		$this->redirect('Homepage:');
	}
	
	
}

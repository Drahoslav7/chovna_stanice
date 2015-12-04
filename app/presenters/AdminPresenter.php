<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class AdminPresenter extends BasePresenter
{
	public function startup()
	{
		parent::startup();
		if ($this->template->isAdmin !== true) {
			$this->redirect("Homepage:default");
		}
	}

	public function actionDefault()
	{
		$this->redirect("Admin:Staff");
	}
	


	public function renderStaff()
	{
		$this->template->staff = $this->mStaff->getStaff();
	}
}

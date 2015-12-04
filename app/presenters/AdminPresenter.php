<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class AdminPresenter extends BasePresenter
{

	public function actionDefault()
	{
		if ($this->template->isAdmin === true) {
			$this->redirect("Admin:staff");
		} else {
			$this->redirect("Homepage:default");
		}
	}
	


	public function renderStaff()
	{
		$this->template->staff = $this->mStaff->getStaff();
	}
}

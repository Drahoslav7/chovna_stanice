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
}

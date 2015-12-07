<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class GuestPresenter extends BasePresenter
{

	public function actionDefault()
	{
		$this->redirect("Guest:dog");
	}


	public function renderDog($id)
	{
		$this->template->dog = $this->mDog->getDogByID($id);
	}
}

<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class KeeperPresenter extends BasePresenter
{
	public function actionDefault()
	{
		if ($this->template->isKeeper == true) {
			$this->redirect("Keeper:dog");
		} else {
			$this->redirect("Homepage:default");
		}
	}


	public function renderDog()
	{

	}


	public function renderOrder()
	{

	}
}

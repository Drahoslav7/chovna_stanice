<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;

class KeeperPresenter extends BasePresenter
{
	public function actionDefault()
	{
		if ($this->template->isClient === true) {
			$this->redirect("Client:data");
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


	public function renderData()
	{

	}
}

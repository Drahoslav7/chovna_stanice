<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;
use App\Model\DogModel;

class KeeperPresenter extends BasePresenter
{
	public function actionDefault()
	{
		if ($this->template->isKeeper === true) {
			$this->redirect("Keeper:doglist");
		} else {
			$this->redirect("Homepage:default");
		}
	}


	public function renderDog()
	{

	}

	public function renderDoglist()
	{
		$this->template->dogs = $this->mDog->getDogs();
		$this->template->races = $this->mDog->getRaces();
	}


	public function renderOrder()
	{

	}
}

<?php

namespace App\Presenters;
use Nette;
use Nette\Application\UI\Form;
use App\Model;
use App\Model\DogModel;

class HomepagePresenter extends BasePresenter
{
	public function renderDefault()
	{
		$this->template->user = $this->getUser();
		$this->template->dogs = $this->mDog->getDogs();
	}
}

<?php

namespace App\Model;


/**
 * Users authenticator.
 */
class BaseModel extends \Nette\Object {

    /** @var \Nette\Database\Context */
    protected $db;

    public function __construct(\Nette\Database\Context $connection) {
        $this->db = $connection;
    }


}
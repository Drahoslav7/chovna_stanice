<?php

namespace App\Model;
use Nette\Security as NS;


/**
 * Users authenticator.
 *
 * @author     John Doe
 * @package    MyApplication
 */
class Authenticator extends \Nette\Object implements NS\IAuthenticator {

    /** @var \Nette\Database\Context */
    private $db;
    private $table = "users";

    public function __construct(\Nette\Database\Context $connection) {
        $this->db = $connection;
    }

    /**
     * Performs an authentication
     * @param  array
     * @return Nette\Security\Identity
     * @throws Nette\Security\AuthenticationException
     */
    public function authenticate(array $credentials) {
        list($username, $password) = $credentials;
        $row = $this->db->table('Uzivatel')->where('Login', $username)->where('Heslo', hash('sha512', $password))->fetch();

        if (!$row) {
            throw new NS\AuthenticationException("Bad username or password", self::IDENTITY_NOT_FOUND);
        }

        return new NS\Identity($row->Login, $row->Role, $row->toArray());
    }

}

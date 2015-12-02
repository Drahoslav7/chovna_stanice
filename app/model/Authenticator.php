<?php

namespace App\Model;
use Nette\Security as NS;


/**
 * Users authenticator.
 *
 * @author     John Doe
 * @package    MyApplication
 */
class Authenticator extends Nette\Object implements NS\IAuthenticator {

    /** @var \DibiConnection */
    private $db;
    private $table = "users";

    public function __construct(Nette\Database\Context $connection) {
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
        $row = $this->db->select('*')->from($this->table)->where('email = %s', $username)->fetch();

        if (!$row) {
            throw new NS\AuthenticationException("User '$username' not found.", self::IDENTITY_NOT_FOUND);
        }

        if ($row->password !== sha1($password . Users::$user_salt)) {
            throw new NS\AuthenticationException("Invalid password.", self::INVALID_CREDENTIAL);
        }

        unset($row->password);
        return new NS\Identity($row->id, $row->role, $row->toArray());
    }

}

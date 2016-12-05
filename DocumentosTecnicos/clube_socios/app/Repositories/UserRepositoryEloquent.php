<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\UserRepository;
use clubeSocios\Models\User;
use clubeSocios\Validators\UserValidator;

/**
 * Class UserRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class UserRepositoryEloquent extends BaseRepository implements UserRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return User::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

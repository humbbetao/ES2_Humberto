<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\DependenteRepository;
use clubeSocios\Models\Dependente;
use clubeSocios\Validators\DependenteValidator;

/**
 * Class DependenteRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class DependenteRepositoryEloquent extends BaseRepository implements DependenteRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Dependente::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

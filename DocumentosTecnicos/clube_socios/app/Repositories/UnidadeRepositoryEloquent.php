<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\UnidadeRepository;
use clubeSocios\Models\Unidade;
use clubeSocios\Validators\UnidadeValidator;

/**
 * Class UnidadeRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class UnidadeRepositoryEloquent extends BaseRepository implements UnidadeRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Unidade::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\SocioRepository;
use clubeSocios\Models\Socio;
use clubeSocios\Validators\SocioValidator;

/**
 * Class SocioRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class SocioRepositoryEloquent extends BaseRepository implements SocioRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Socio::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

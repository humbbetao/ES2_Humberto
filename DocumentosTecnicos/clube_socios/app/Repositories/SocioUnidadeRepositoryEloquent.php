<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\Socio_unidadeRepository;
use clubeSocios\Models\SocioUnidade;
use clubeSocios\Validators\SocioUnidadeValidator;

/**
 * Class SocioUnidadeRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class SocioUnidadeRepositoryEloquent extends BaseRepository implements SocioUnidadeRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return SocioUnidade::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

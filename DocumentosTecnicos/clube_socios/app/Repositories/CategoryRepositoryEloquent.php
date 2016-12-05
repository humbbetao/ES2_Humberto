<?php

namespace clubeSocios\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use clubeSocios\Repositories\CategoryRepository;
use clubeSocios\Models\Category;
use clubeSocios\Validators\CategoryValidator;

/**
 * Class CategoryRepositoryEloquent
 * @package namespace clubeSocios\Repositories;
 */
class CategoryRepositoryEloquent extends BaseRepository implements CategoryRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Category::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}

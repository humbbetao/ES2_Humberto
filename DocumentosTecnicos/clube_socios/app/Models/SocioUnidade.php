<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class SocioUnidade extends Model implements Transformable
{
    use TransformableTrait;

    protected $fillable = [
    	'id_socio', 'id_unidade'
    ];

	public function socioUnidade()	{
	    return $this->belongsToMany(Socio::class);
	}

}

<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Dependente extends Model implements Transformable
{
    use TransformableTrait;

    protected $fillable = [
    	'socio_id', 'nome', 'parentesco', 'idade'
    ];

    public function socio(){
    	return $this->belongsTo(Socio::class);
    };

}

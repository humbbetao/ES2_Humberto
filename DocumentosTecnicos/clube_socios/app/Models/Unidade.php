<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Unidade extends Model implements Transformable
{
    use TransformableTrait;

    protected $fillable = [
    	'nome', 'tipo', 'endereco', 'cidade', 'estado'
    ];

    public function socio(){
    	return $this->belongsToMany(Socio::class);
    }

}

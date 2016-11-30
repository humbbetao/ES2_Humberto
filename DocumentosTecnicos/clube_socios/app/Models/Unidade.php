<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;

class Unidade extends Model
{
    protected $fillable = [
    	'nome', 'tipo', 'endereco', 'cidade', 'estado'
    ];

    public function socio(){
    	return $this->belongsToMany(Socio::class);
    }
}

<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;

class Dependente extends Model
{
    protected $fillable = [
    	'socio_id', 'nome', 'parentesco', 'idade'
    ];


    public function socio(){
    	return $this->belongsTo(Socio::class);
    }
}

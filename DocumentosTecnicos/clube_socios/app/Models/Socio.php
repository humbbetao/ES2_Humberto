<?php

namespace clubeSocios\Models;

use Illuminate\Database\Eloquent\Model;

class Socio extends Model
{
protected $fillable = ['user_id', 'telefone', 'endereco', 'cidade', 'estado', 'valor_mensalidade'];

    public function user(){
    	return $this->hasOne(User::class);
    }

    public function dependente(){
    	return $this->hasMany(Dependente::class);
    }

    public function unidade(){
    	return $this->belongsToMany(Unidade::class);
    }
}

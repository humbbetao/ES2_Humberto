<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSociosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('socios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('unidade_id')->unsigned();
            $table->foreign('unidade_id')->references('id')->on('unidade');
            $table->string('telefone');
            $table->string('endereco');
            $table->string('cidade');
            $table->string('estado');
            $table->float('valor_mensalidade'); 

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('socios');
    }
}

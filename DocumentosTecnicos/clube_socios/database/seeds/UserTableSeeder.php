<?php

use Illuminate\Database\Seeder;
use clubeSocios\Models\User;
use clubeSocios\Models\Socio;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(User::class, 10)->create()->each(function($u){
            $u->socio()->save(factory(Socio::class)->make());
        });
     }
    
}

<?php

use Illuminate\Database\Seeder;
use clubeSocios\Models\User;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(User::class, 10)->create();
    }
}

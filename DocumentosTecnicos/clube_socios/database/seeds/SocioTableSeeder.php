<?php

use Illuminate\Database\Seeder;
use clubeSocios\Models\Socio;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(Socio::class, 10)->create();
    }
}

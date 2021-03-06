<?php

use Illuminate\Database\Seeder;
use clubeSocios\Models\Category;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	factory(Category::class, 10)->create();
    }
}

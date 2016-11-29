<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(clubeSocios\Models\User::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->safeEmail,
        'password' => bcrypt(str_random(10)),
        'remember_token' => str_random(10),
    ];
});

$factory->define(clubeSocios\Models\Category::class, function(Faker\Generator $faker) {
	return [
		'name' => $faker->word
	];
});

$factory->define(clubeSocios\Models\Socio::class, function(Faker\Generator $faker) {
	return [
		'telefone' => $faker->phoneNumber,
		'endereco' => $faker->address,
		'cidade' => $faker->city,
		'estado' => $faker->state,
		'valor_mensalidade' => $faker->randomFloat
	];
});
<?php

namespace clubeSocios\Http\Controllers;

use Illuminate\Http\Request;

use clubeSocios\Http\Requests;
use clubeSocios\Http\Controllers\Controller;

class CategoriesController extends Controller
{
	public function index(){

		$nome = "Coiso";
		return view('admin.categories.index', compact('nome'));

	}
}

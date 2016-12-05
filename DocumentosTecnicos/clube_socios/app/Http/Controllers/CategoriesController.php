<?php

namespace clubeSocios\Http\Controllers;

use clubeSocios\Repositories\CategoryRepository;
use Illuminate\Http\Request;

use clubeSocios\Http\Requests;
use clubeSocios\Http\Controllers\Controller;

class CategoriesController extends Controller
{
	public function index(CategoryRepository $repository){

        $categories = $repository->paginate(5);

		return view('admin.categories.index', compact('categories'));

	}

	public function create(){
	    return view('admin.categories.create');

    }

    public function store(){

    }
}

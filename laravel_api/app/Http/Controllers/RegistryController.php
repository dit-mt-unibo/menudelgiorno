<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegistryRequest;
use App\Http\Resources\RegistryResource;
use App\Models\Registry;
use Illuminate\Http\Request;

class RegistryController extends Controller
{

    public function index()
    {
        $registry = Registry ::latest()->get();
        return response()->json([ 'Registries fetched.',$registry]);
    }


    public function store(RegistryRequest $request)
    {
        $registry=new Registry();

        $registry=Registry::create( [
            'name' => $request->name,
            'surname' => $request->surname,
            'email' => $request->email,
            'user_id' => $request->user_id,
        ]);

        return response()->json(['Registry created successfully.',new RegistryResource($registry) ]);

    }


    public function show($id)
    {
        $registry=Registry::find($id);

        if(is_null($registry)){
            return response()->json('Data not found', 404);
        }
        return response()->json(new RegistryResource($registry));
    }



    public function update(RegistryRequest $request,Registry $registry)
    {
        $registry->name=$request->name;
        $registry->surname=$request->surname;
        $registry->email=$request->email;
        $registry->user_id=$request->user_id;


        return response()->json(['Registry updated successfully.',new RegistryResource($registry)]);
    }


    public function destroy(Registry  $registry)
    {
        $registry->delete();


        return response()->json('Registry deleted successfully');
    }
}

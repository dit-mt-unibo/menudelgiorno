<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegistryRequest;
use App\Http\Resources\RegistryResource;
use App\Models\Registry;
use Illuminate\Http\Request;

class RegistryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $registry = Registry ::latest()->get();
        return response()->json([RegistryResource::collection($registry), 'Registries fetched.']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RegistryRequest $request)
    {
        $registry=new Registry();

        $registry=Registry::create($request->input('registry'));

        return response()->json(['Registry created successfully.', new RegistryResource($registry)]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $registry =Registry::find($id);
        if (is_null($registry)) {
            return response()->json('Data not found', 404);
        }
        return response()->json(['ok',new RegistryResource($registry)]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(RegistryRequest $request,Registry $registry)
    {
        $registry->update($request->input('registry'));
        return response()->json(['Registry updated successfully.', new RegistryResource($registry)]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Registry  $registry)
    {
        $registry->delete();


        return response()->json('Registry deleted successfully');
    }
}

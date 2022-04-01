<?php

namespace App\Http\Controllers\Api;

use App\Models\Registry;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Http\Requests\RegistryRequest;
use App\Http\Resources\RegistryResource;

class RegistryController extends Controller
{
    public function index()
    {
        $registry = Registry::latest()->get();
        return response()->json(['Registries fetched.', RegistryResource::collection($registry)]);
    }

    public function store(RegistryRequest $request)
    {
        $registry = new Registry();
        $registry = Registry::create([
            'name' => $request->name,
            'surname' => $request->surname,
            'email' => $request->email,
            'user_id' => $request->user_id,
        ]);

        return response()->json(['Registry created successfully.', new RegistryResource($registry)]);
    }

    public function show($userId)
    {
        $registry = Registry::where('user_id', $userId)->first();

        return response()
            ->json([
                'registry' => new RegistryResource($registry)
            ])
            ->setStatusCode(Response::HTTP_OK);
    }

    public function update(RegistryRequest $request, Registry $registry)
    {
        $registry->update([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
        ]);

        return response()
            ->json([
                'message' => 'Anagrafica modificata con successo!',
                'registry' => new RegistryResource($registry)
            ])
            ->setStatusCode(Response::HTTP_OK);
    }

    public function destroy(Registry $registry)
    {
        $registry->delete();
        return response()->json('Registry deleted successfully');
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Models\Restaurant;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Http\Requests\RestaurantRequest;
use App\Http\Resources\RestaurantResource;

class RestaurantController extends Controller
{
    public function index()
    {
        return response()->json( RestaurantResource::collection(Restaurant::all()));
    }

    public function store(RestaurantRequest $request)
    {
        $restaurant = new Restaurant();

        $restaurant = Restaurant::create([
            'name' => $request->name,
            'address' => $request->address,
            'street_number' => $request->street_number,
            'postcode' => $request->postcode,
            'city' => $request->city,
            'province' => $request->province,
            'user_id' => $request->user_id
        ]);

        return response()->json( new RestaurantResource($restaurant));
    }

    public function show($userId)
    {
        $restaurant = Restaurant::where('user_id', $userId)->first();

        return response()
            ->json([
                'message' => 'Ristorante ottenuto con successo!',
                'restaurant' => new RestaurantResource($restaurant)
            ])
            ->setStatusCode(Response::HTTP_OK);
    }

    public function update(RestaurantRequest $request, Restaurant $restaurant)
    {
        $restaurant->update([
            'name' => $request->name,
            'address' => $request->address,
            'street_number' => $request->street_number,
            'postcode' => $request->postcode,
            'city' => $request->city,
            'province' => $request->province,
        ]);

        return response()
            ->json([
                'message' => 'Ristorante modificato con successo!',
                'restaurant' => new RestaurantResource($restaurant)
            ])
            ->setStatusCode(Response::HTTP_OK);
    }

    public function destroy(Restaurant $restaurant)
    {
        $restaurant->delete();

        return response()->json(['Restaurant cancelled successful']);
    }
}

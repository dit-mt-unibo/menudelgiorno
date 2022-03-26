<?php

namespace App\Http\Controllers\Api;

use App\Models\Restaurant;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\RestaurantRequest;
use App\Http\Resources\RestaurantResource;

class RestaurantController extends Controller
{

    public function index()
    {
        return response()->json(['Restaurant fetched', RestaurantResource::collection(Restaurant::all())]);
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

        return response()->json(['Restaurant created successful', new RestaurantResource($restaurant)]);
    }


    public function show($id)
    {
        $restaurant = Restaurant::find($id);

        if (is_null($restaurant)) {
            return response()->json(['Restaurant not found']);
        }

        return response()->json(new RestaurantResource($restaurant));
    }


    public function update(RestaurantRequest $request, Restaurant $restaurant)
    {
        $restaurant->name = $request->name;
        $restaurant->address = $request->address;
        $restaurant->street_number = $request->street_number;
        $restaurant->postcode = $request->postcode;
        $restaurant->city = $request->city;
        $restaurant->province = $request->province;
        $restaurant->user_id = $request->user_id;

        $restaurant->save();

        return response()->json(['Restaurant updated successful', new RestaurantResource($restaurant)]);
    }



    public function destroy(Restaurant $restaurant)
    {
        $restaurant->delete();

        return response()->json(['Restaurant cancelled successful']);
    }
}

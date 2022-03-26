<?php

namespace App\Http\Controllers\Api;

use App\Models\Restaurant;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\restaurantRequest;

class RestaurantController extends Controller
{

    public function index()
    {
        return response()->json(Restaurant::all());
    }




    public function store(restaurantRequest $request)
    {
    }


    public function show($id)
    {
        //
    }


    public function update(Request $request, $id)
    {
        //
    }



    public function destroy(Restaurant $restaurant)
    {
        $restaurant->delete();
    }
}

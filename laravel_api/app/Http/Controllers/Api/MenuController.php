<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\MenuRequest;
use App\Http\Resources\MenuResource;
use App\Models\Menu;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MenuController extends Controller
{

    public function index()
    {
        $menu=Menu::get();
        return response()->json( ['Menu fetched.', MenuResource::collection($menu)]);
    }

    public function store(MenuRequest $request,Menu $menu)
    {
        // $menu=new menu();
        $menu=Menu::create([
            'name'=>$request->name,
            'text'=>$request->text,
            'restaurant_id'=>$request->restaurant_id,

        ]);


        return response()->json(['Menu created successfully.', new MenuResource($menu)]);
    }


    public function show($id)
    {
        $menu=Menu::find($id);
        if(is_null($menu))
        {
            return response()->json('menu non trovato',404);
        }
        return response()->json([new MenuResource($menu)]);
    }


    public function update(MenuRequest $request, Menu $menu)
    {
        $menu->name=$request->name;
        $menu->text=$request->text;
        $menu->restaurant_id=$request->restaurant_id;
        $menu->save();
        return response()->json(['Menu updated successfully.', new MenuResource($menu)]);
    }


    public function destroy(Menu $menu)
    {
        $menu->delete();
        return response()->json(['Menu deleted successfully']);
    }

}

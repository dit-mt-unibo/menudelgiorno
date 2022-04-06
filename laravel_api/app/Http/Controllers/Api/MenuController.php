<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\MenuRequest;
use App\Http\Resources\MenuResource;
use App\Models\Menu;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\languageRequest;
use App\Models\Translation;
use App\Facade\MenuFacade;

class MenuController extends Controller
{
    public $facade;

    function __construct()
    {
        $this->facade=new MenuFacade();
    }

    public function index()
    {
        $menu = Menu::with(['restaurant'])->get();
        return MenuResource::collection($menu)->response();
    }

    public function store(MenuRequest $request,Menu $menu)
    {
        //recuperer la langue
         $language_idArray=$request->input('language_idArray');
         $text=$request->input('text');
         $restaurant_id=$request->input('restaurant_id');



        $menu=$this->facade->create($language_idArray,$text,$restaurant_id);
        return response()->json($menu);
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
        $menu->text=$request->input('text');
        $menu->restaurant_id=$request->input('restaurant_id');
        $menu->save();
        return response()->json(['Menu updated successfully.', new MenuResource($menu)]);
    }


    public function destroy(Menu $menu)
    {
        $menu->delete();
        return response()->json(['Menu deleted successfully']);
    }

}

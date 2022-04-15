<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\MenuRequest;
use App\Http\Resources\MenuResource;
use App\Models\Menu;
use Illuminate\Http\Response;
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
        $menu = Menu::with(['restaurant.user'])->get();
        return MenuResource::collection($menu)->response();
    }


    // Nouvo menu da tradurre inserito da un ristauratore

    public function store(MenuRequest $request,Menu $menu)
    {

         $language_idArray=$request->input('language_idArray');//input la lingue
         //$text=$request->input('text');//input testo da tradurre
         $restaurant_id=$request->input('restaurant_id');//input restaurant

          $text="l&apos;acqua del mare <a  href='' id='tigella'>dnt01</a>";


        $menu=$this->facade->create($language_idArray,$text,$restaurant_id);
        return response()->json($menu);
    }


    // visualizzazione di un menu

    public function show($id)
    {
        $menu = Menu::find($id);
        if(is_null($menu))
        {
            return response()->json('menu non trovato',404);
        }
        return (new MenuResource($menu->loadMissing(['restaurant.user'])));
    }

    public function update(MenuRequest $request, Menu $menu)
    {
        $menu->text=$request->input('text');
        $menu->restaurant_id=$request->input('restaurant_id');
        $menu->save();
        return response()->json( new MenuResource($menu)) ->setStatusCode(Response::HTTP_OK);;
    }




    public function destroy(Menu $menu)
    {
        $menu->delete();
        return response()->json(['Menu deleted successfully']);
    }

}

<?php

namespace App\Http\Controllers;

use App\Http\Requests\MenuRequest;
use App\Http\Resources\MenuResource;
use App\Models\Menu;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu=Menu::get();
        return response()->json(['menu trovati',$menu]);
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MenuRequest $request,Menu $menu)
    {
        // $menu=new menu();
        $menu=Menu::create([
            'name'=>$request->name,
            'text'=>$request->text,
            'restaurant_id'=>$request->restaurant_id,

        ]);


        return response()->json(['menu creato',new MenuResource($menu)]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $menu=Menu::find($id);
        if(is_null($menu))
        {
            return response()->json('menu non trovato',404);
        }
        return response()->json(new MenuResource($menu));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(MenuRequest $request, Menu $menu)
    {
        $menu->name=$request->name;
        $menu->text=$request->text;
        $menu->restaurant_id=$request->restaurant_id;
        $menu->save();
        return response()->json(['menu aggiornato',new MenuResource($menu)]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        $menu->delete();
        return response()->json(['menu cancellato']);
    }

}

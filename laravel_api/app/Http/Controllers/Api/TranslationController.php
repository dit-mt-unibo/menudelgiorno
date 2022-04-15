<?php

namespace App\Http\Controllers\Api;

use App\Facade\TranslationFacade;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\TranslationRequest;
use App\Http\Resources\TranslationResource;
use App\Models\Translation;
use Illuminate\Support\Facades\Auth;

class TranslationController extends Controller
{
    public $facade;
    function __construct()
    {
        $this->facade=new TranslationFacade();
    }

    public function index()
    {

        $translation = Translation::with(['language','menu.restaurant'])->where('state',0)->orderByDesc('created_at')->get();
        return TranslationResource::collection($translation)->response();
    }



    public function store(TranslationRequest $request)
    {
        $translation=new Translation();
        $translation=Translation::create([
            'text' => $request->text,
            'language_id' => $request->language_id,
        ]);


        return response()->json([new TranslationResource($translation)]);
    }


    public function show($id)
    {
        $resultat=$this->facade->show($id);
        return response()->json($resultat);
    }


    public function update(TranslationRequest $request,Translation $translation)
    {
        $translation->update([
            'text' => $request->input('text'),
            'user_id'=>$request->input('user_id'),
            'state'=>1,
        ]);
        return response()->json(new TranslationResource($translation));
    }




    public function destroy(Translation $translation)
    {
        $translation->delete();

        return response()->json('Translation deleted successfully');
    }
}

<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\TranslationRequest;
use App\Http\Resources\TranslationResource;
use App\Models\Translation;

class TranslationController extends Controller
{

    public function index()
    {

        $translation = Translation::with(['language','menu.restaurant'])->where('state',0)->get();
        return TranslationResource::collection($translation)->response();
    }



    public function store(TranslationRequest $request)
    {
        $translation=new Translation();
        $translation=Translation::create([
            'text' => $request->text,
            'language_id' => $request->language_id,
        ]);


        return response()->json(['translation created successfully.', new TranslationResource($translation)]);
    }


    public function show($id)
    {
        $translation = Translation::find($id);

        if (is_null($translation)) {
            return response()->json('Data not found', 404);
        }
        return response()->json(new TranslationResource($translation));
    }


    public function update(TranslationRequest $request,Translation $translation)
    {

        $translation->update([
            'text' => $request->input('text'),
            'state'=>1,
        ]);


        return response()->json(['translation updated successfully.', new TranslationResource($translation)]);
    }




    public function destroy(Translation $translation)
    {
        $translation->delete();

        return response()->json('Translation deleted successfully');
    }
}
